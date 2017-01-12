//
//  JUserDataManager.h
//  Keychain
//
//  Created by Jack on 15/11/4.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JUserDataManager : NSObject

+ (void)savePassWord:(NSString *)password;

+ (id)readPassWord;

+ (void)deletePassWord;

@end
