//
//  NSDate+Additions.h
//  Search_Calendar
//
//  Created by yan.panpan on 13-9-20.
//  Copyright (c) 2013年 llbt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)

/*
 @author yanpp
 @func 从年月日获得当天是星期几
 @var  例如：year = 2008 month = 12 day = 5
 @return 1－7, Sunday－Saturday
 */
+ (NSInteger)getWeekDayFromYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/*
 @author yanpp
 @func 从年月获得当月有多少天
 @var 例如：year = 2008 month = 12
 */
+ (NSInteger)getDaySumFromYear:(NSInteger)year month:(NSInteger)month;

/*
 @author yanpp
 @func 判断某个日期是不是今天
 @var 例如：year = 2008 month = 12 day = 27
 */
+ (BOOL)isTodaytheYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/*
 @author yanpp
 @func 计算今天之前或之后的日期
 @var number>0 ，number天之前的日期
 @var number<0 ，number天之后的日期
 */
+ (NSDateComponents*)thDateNumberDaysAgo:(NSInteger)number;

@end
