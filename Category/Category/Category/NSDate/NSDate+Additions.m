//
//  NSDate+Additions.m
//  Search_Calendar
//
//  Created by yan.panpan on 13-9-20.
//  Copyright (c) 2013年 llbt. All rights reserved.
//

#import "NSDate+Additions.h"

@implementation NSDate (Additions)

+ (NSInteger)getWeekDayFromYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setYear:year];
    [comps setMonth:month];
    [comps setDay:day];
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [calendar dateFromComponents:comps];
    
    NSUInteger unitFlags = NSWeekdayCalendarUnit | NSWeekCalendarUnit;
    NSDateComponents *weekComs = [calendar components:unitFlags fromDate:date];
    NSInteger weekday = weekComs.weekday;
    return weekday;
}

+ (NSInteger)getDaySumFromYear:(NSInteger)year month:(NSInteger)month {
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setYear:year];
    [comps setMonth:month];
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [calendar dateFromComponents:comps];
//     [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length
    return [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date].length;
}

+ (BOOL)isTodaytheYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *today = [NSDate date];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *todayComs = [calendar components:unitFlags fromDate:today];
        if (todayComs.year == year && todayComs.month == month && todayComs.day == day) {
        return YES;
    } else{
        return NO;
    }
}

+ (NSDateComponents*)thDateNumberDaysAgo:(NSInteger)number{
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceNow:-number * 24 * 3600];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlag = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlag fromDate:newDate];
        return comps;
}

@end
