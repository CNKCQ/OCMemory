//
//  UITextField+EncryptText.m
//  kuaixian
//
//  Created by zuoyinbin on 14-10-17.
//  Copyright (c) 2014年 Jack_wang. All rights reserved.
//

#import "UITextField+EncryptText.h"
#import <objc/runtime.h>

@implementation UITextField (EncryptText)

const void *transactionkey = (void*)@"EncryptTransactionTextKey";
const void *loginkey = (void*)@"EncryptLoginTextKey";

- (void)setTextTranscationEncrypt:(NSString *)textEncrypt
{
    objc_setAssociatedObject(self, transactionkey, textEncrypt, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//- (NSString *)textTranscationEncrypt
//{
//    NSString *text = objc_getAssociatedObject(self, transactionkey);
//    return [Common transactionpassword:text];
//}

- (void)setTextLoginEncrypt:(NSString *)textEncrypt
{
    objc_setAssociatedObject(self, loginkey, textEncrypt, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//- (NSString *)textLoginEncrypt
//{
//    NSString *text = objc_getAssociatedObject(self, loginkey);
//    return [Common logpassword:text];
//}

@end
