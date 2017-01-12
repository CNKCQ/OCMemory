//
//  NSObject+Persistent.h
//  hztour-iphone
//
//  Created by liu ding on 12-1-17.
//  Copyright 2012年 teemax. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSObject (Persistent)
-(NSString *) className;//类名
-(NSString *) propertyNameToColumnName:(NSString *)propertyName;//将类属性转化为表字段
-(NSString *)columnNameToPropertyName:(NSString *)colName;//将表字段转化成类属性
-(NSArray *) propertyNames;//取得类属性名
-(NSDictionary *)propertyParams;//取得类属性值--key:属性名,value:属性值
-(NSDictionary *)propertyTypes;//取得类属性类型--key:属性名,value:属性类型(用于建表语句)

@end
