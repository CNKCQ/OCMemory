//
//  JKeyChain.m
//  Keychain
//
//  Created by Jack on 15/11/4.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "JKeyChain.h"

@implementation JKeyChain
/**
 *  查询方法
 *
 *  @param service 查询字段
 *
 *  @return 返回结果字典
 */
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service{
  
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:(__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,service,(__bridge_transfer id)kSecAttrService,service,(__bridge_transfer id)kSecAttrAccount,(__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible, nil];
}
/**
 *  存储方法
 *
 *  @param service
 *  @param data    存储数据
 */
+ (void)save:(NSString *)service data:(id)data{
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
}
/**
 *  加载
 *
 *  @param service
 *
 *  @return 加载数据
 */
+ (id)load:(NSString *)service{
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    // Configure th search setting
    [keychainQuery setObject:(__bridge_transfer id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        }
        @catch (NSException *exception) {
             NSLog(@"Unarchive of %@ failed: %@", service, exception);
        }
        @finally {
            
        }
        
    }
    
    return ret;
}
/**
 *  删除
 *
 *  @param service
 */
+ (void)delete:(NSString *)service{
    NSMutableDictionary *keychainQuary = [self getKeychainQuery:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuary);
}
@end
