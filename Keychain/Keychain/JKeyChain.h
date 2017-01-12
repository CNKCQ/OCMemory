//
//  JKeyChain.h
//  Keychain
//
//  Created by Jack on 15/11/4.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKeyChain : NSObject
/**
 *  查询方法
 *
 *  @param service 查询字段
 *
 *  @return 返回结果字典
 */
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
/**
 *  存储方法
 *
 *  @param service
 *  @param data    存储数据
 */
+ (void)save:(NSString *)service data:(id)data;
/**
 *  加载
 *
 *  @param service
 *
 *  @return 加载数据
 */
+ (id)load:(NSString *)service;
/**
 *  删除
 *
 *  @param service 
 */
+ (void)delete:(NSString *)service;
@end
