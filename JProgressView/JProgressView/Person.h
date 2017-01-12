//
//  Person.h
//  JProgressView
//
//  Created by Jack on 15/11/26.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, assign)float times;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray *datas;
@property (nonatomic, copy) NSDictionary *dic;
@property (nonatomic, assign,setter=isNew:)Boolean new;
- (void)test;
@end
