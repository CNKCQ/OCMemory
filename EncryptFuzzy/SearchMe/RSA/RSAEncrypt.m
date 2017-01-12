//
//  RSAEncrypt.m
//  SearchMe
//
//  Created by Jack on 16/3/15.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "RSAEncrypt.h"


@interface RSAEncrypt () {
    SecKeyRef _publicKey;
    SecKeyRef _privateKey;
}

@end

@implementation RSAEncrypt
IMP_SIGLETON(RSAEncrypt)
#pragma mark - 加密相关
- (void)loadPublicKeyWithPath:(NSString *)derFilePath {
    NSData *derData = [[NSData alloc] initWithContentsOfFile:derFilePath];
    if (derData.length > 0) {
        [self loadPublicKeyWithData:derData];
    } else {
        NSLog(@"load public key fail with path: %@", derFilePath);
    }
}

- (void)loadPublicKeyWithData:(NSData *)derData {
    SecCertificateRef myCertificate = SecCertificateCreateWithData(kCFAllocatorDefault, (__bridge CFDataRef)derData);
    SecPolicyRef myPolicy = SecPolicyCreateBasicX509();
    SecTrustRef myTrust;
    OSStatus status = SecTrustCreateWithCertificates(myCertificate,myPolicy,&myTrust);
    SecTrustResultType trustResult;
    
    if (status == noErr) {
        status = SecTrustEvaluate(myTrust, &trustResult);
    }
    
    SecKeyRef securityKey = SecTrustCopyPublicKey(myTrust);
    CFRelease(myCertificate);
    CFRelease(myPolicy);
    CFRelease(myTrust);
    _publicKey = securityKey;
}

- (NSString *)rsaEncryptText:(NSString *)text {
    
    NSData *textData = [text dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedData = [self rsaEncryptData:textData];
    NSString *base64EncryptedString = [GTMBase64 stringByEncodingData:encryptedData];
    return base64EncryptedString;
}

- (NSData *)rsaEncryptData:(NSData *)data {
    SecKeyRef key = _publicKey;
    
    size_t cipherBufferSize = SecKeyGetBlockSize(key);
    uint8_t *cipherBuffer = malloc(cipherBufferSize * sizeof(uint8_t));
    size_t blockSize = cipherBufferSize - 11;
    size_t blockCount = (size_t)ceil([data length] / (double)blockSize);
    
    NSMutableData *encryptedData = [[NSMutableData alloc] init] ;
    for (int i = 0; i < blockCount; i++) {
        size_t bufferSize = MIN(blockSize,[data length] - i * blockSize);
        NSData *buffer = [data subdataWithRange:NSMakeRange(i * blockSize, bufferSize)];
        OSStatus status = SecKeyEncrypt(key,
                                        kSecPaddingPKCS1,
                                        (const uint8_t *)[buffer bytes],
                                        [buffer length],
                                        cipherBuffer,
                                        &cipherBufferSize);
        if (status == noErr) {
            NSData *encryptedBytes = [[NSData alloc] initWithBytes:(const void *)cipherBuffer
                                                            length:cipherBufferSize];
            [encryptedData appendData:encryptedBytes];
        } else {
            if (cipherBuffer) {
                free(cipherBuffer);
            }
            
            return nil;
        }
    }
    if (cipherBuffer){
        free(cipherBuffer);
    }
    
    return encryptedData;
}

#pragma mark - 解密相关
- (void)loadPrivateKeyWithPath:(NSString *)p12FilePath password:(NSString *)p12Password {
    NSData *data = [NSData dataWithContentsOfFile:p12FilePath];
    
    if (data.length > 0) {
        [self loadPrivateKeyWithData:data password:p12Password];
    } else {
        NSLog(@"load private key fail with path: %@", p12FilePath);
    }
}

- (void)loadPrivateKeyWithData:(NSData *)p12Data password:(NSString *)p12Password {
    SecKeyRef privateKeyRef = NULL;
    NSMutableDictionary * options = [[NSMutableDictionary alloc] init];
    
    [options setObject:p12Password forKey:(__bridge id)kSecImportExportPassphrase];
    
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    OSStatus securityError = SecPKCS12Import((__bridge CFDataRef)p12Data,
                                             (__bridge CFDictionaryRef)options,
                                             &items);
    
    if (securityError == noErr && CFArrayGetCount(items) > 0) {
        CFDictionaryRef identityDict = CFArrayGetValueAtIndex(items, 0);
        SecIdentityRef identityApp = (SecIdentityRef)CFDictionaryGetValue(identityDict,
                                                                          kSecImportItemIdentity);
        securityError = SecIdentityCopyPrivateKey(identityApp, &privateKeyRef);
        
        if (securityError != noErr) {
            privateKeyRef = NULL;
        }
    }
    
    _privateKey = privateKeyRef;
    
      CFRelease(items);
}

- (NSString *)rsaDecryptText:(NSString *)text {
    NSData *data = [GTMBase64 decodeString:text];
    
    NSData *decryptData = [self rsaDecryptData:data];
    
    NSString *result = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    return result;
}

- (NSData *)rsaDecryptData:(NSData *)data {
    SecKeyRef key = _privateKey;
    if (!key) {
        NSLog(@"私钥密码有误");
        return nil;
    }
    size_t cipherLen = [data length];
    void *cipher = malloc(cipherLen);
    
    [data getBytes:cipher length:cipherLen];
    size_t plainLen = SecKeyGetBlockSize(key) - 12;
    
    void *plain = malloc(plainLen);
    OSStatus status = SecKeyDecrypt(key, kSecPaddingPKCS1, cipher, cipherLen, plain, &plainLen);
    
    if (status != noErr) {
        return nil;
    }
    
    NSData *decryptedData = [[NSData alloc] initWithBytes:(const void *)plain length:plainLen];
    
    return decryptedData;
}

- (void)dealloc {
    if (nil != _publicKey) {
        CFRelease(_publicKey);
    }
    
    if (nil != _privateKey) {
        CFRelease(_privateKey);
    }
}


@end
