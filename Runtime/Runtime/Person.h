//
//  Person.h
//  Runtime
//
//  Created by Jack on 15/11/3.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject <NSCoding,NSCopying>

@property (nonatomic, assign) int age;
@property (nonatomic, assign) int height;
@property (nonatomic, copy) NSString *name;
+ (NSSet *)propertyKeys;
@end
