//
//  RSAEncrypt.h
//  SearchMe
//
//  Created by Jack on 16/3/15.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMBase64.h"
#import "Sigleton.h"

@interface RSAEncrypt : NSObject
DEF_SIGLETON(RSAEncrypt)

// 加密相关
- (void)loadPublicKeyWithPath:(NSString *)derFilePath;
- (void)loadPublicKeyWithData:(NSData *)derData;
- (NSString *)rsaEncryptText:(NSString *)text;
- (NSData *)rsaEncryptData:(NSData *)data;

// 解密相关
- (void)loadPrivateKeyWithPath:(NSString *)p12FilePath password:(NSString *)p12Password;
- (void)loadPrivateKeyWithData:(NSData *)p12Data password:(NSString *)p12Password;
- (NSString *)rsaDecryptText:(NSString *)text;
- (NSData *)rsaDecryptData:(NSData *)data;

@end
