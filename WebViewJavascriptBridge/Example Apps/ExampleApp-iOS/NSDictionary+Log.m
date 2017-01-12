//
//  NSDictionary+Log.m
//  ExampleApp-iOS
//
//  Created by Jack on 15/7/26.
//  Copyright (c) 2015年 Marcus Westin. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale
 {
         NSArray *allKeys = [self allKeys];
         NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"{\t\n "];
         for (NSString *key in allKeys) {
                 id value= self[key];
                 [str appendFormat:@"\t \"%@\" = %@,\n",key, value];
             }
         [str appendString:@"}"];
    
        return str;
     }
@end
