//
//  JUserDataManager.m
//  Keychain
//
//  Created by Jack on 15/11/4.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "JUserDataManager.h"
#import "JKeyChain.h"

@implementation JUserDataManager

static NSString * const KEY_IN_KEYCHAIN = @"com.jack.app.info";
static NSString * const KEY_PASSWORD = @"com.jack.app.password";

+ (void)savePassWord:(NSString *)password{
    NSMutableDictionary *usernamePasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamePasswordKVPairs setObject:password forKey:KEY_PASSWORD];
    [JKeyChain save:KEY_IN_KEYCHAIN data:usernamePasswordKVPairs];
}

+ (id)readPassWord{
    NSMutableDictionary *usernamePasswordKVPair = (NSMutableDictionary *)[JKeyChain load:KEY_IN_KEYCHAIN];
    return [usernamePasswordKVPair objectForKey:KEY_PASSWORD];
}

+ (void)deletePassWord{
    
    [JKeyChain delete:KEY_IN_KEYCHAIN];
}
@end
