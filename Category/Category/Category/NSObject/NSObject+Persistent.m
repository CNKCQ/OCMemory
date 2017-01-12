////
////  NSObject+Persistent.m
////  hztour-iphone
////
////  Created by liu ding on 12-1-17.
////  Copyright 2012年 teemax. All rights reserved.
////
//
//#import "NSObject+Persistent.h"
//#import <objc/runtime.h>
//
//
//@implementation NSObject (Persistent)
//
//-(NSString *)className{
////    NSLog(@"className:%@",[NSString stringWithUTF8String:class_getName([self class])]);
//    return [NSString stringWithUTF8String:class_getName([self class])];
//}
//
//-(NSString *)propertyNameToColumnName:(NSString *)propertyName{
//    NSMutableString *ret = [NSMutableString string];
//    if(propertyName!=nil && [propertyName length]>0){
//        for (int i = 0; i < propertyName.length; i++)
//        {
//            NSRange range = NSMakeRange(i, 1);
//            NSString *oneChar = [propertyName substringWithRange:range];
//            if ([oneChar isEqualToString:[oneChar uppercaseString]] && i > 0)
//                [ret appendFormat:@"_%@", [oneChar lowercaseString]];
//            else
//                [ret appendString:[oneChar lowercaseString]];
//        }
//    }else{
//        NSLog(@"warning:传入'propertyNameToColumnName'方法的参数为空");
//    }
//	return ret;
//}
//
//-(NSString *)columnNameToPropertyName:(NSString *)colName{
//    BOOL lastWasUnderscore = NO;
//	NSMutableString *ret = [NSMutableString string];
//	for (int i=0; i < [colName length]; i++)
//	{
//		NSRange sRange = NSMakeRange(i,1);
//		NSString *oneChar = [colName substringWithRange:sRange];
//		if ([oneChar isEqualToString:@"_"])
//			lastWasUnderscore = YES;
//		else
//		{
//			if (lastWasUnderscore)
//				[ret appendString:[oneChar uppercaseString]];
//			else
//				[ret appendString:oneChar];
//			
//			lastWasUnderscore = NO;
//		}
//	}
//	return ret;
//}
//
//-(NSArray *)propertyNames{
//    NSMutableArray *propertyNamesArr=[[NSMutableArray new] autorelease];
//    unsigned int outCount;
//    objc_property_t * const properties=class_copyPropertyList([self class], &outCount);
//    if(outCount>0){
//        for(int i=outCount-1;i>=0;i--){
//            NSString *propertyName = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding];
//            NSString *propertyType=@"";
//            NSString *attrs = [NSString stringWithUTF8String: property_getAttributes(properties[i])];
////            NSLog(@"propertyType:%@",attrs);
//            if ([attrs rangeOfString:@",R,"].location == NSNotFound){
//                NSArray *attrParts = [attrs componentsSeparatedByString:@","];
//                if (attrParts != nil){
//                    if ([attrParts count] > 0){
//                        propertyType = [[attrParts objectAtIndex:0] substringFromIndex:1];
////                        NSLog(@"propertyType:%@",propertyType);
//                    }
//                }
//            }
//            if([propertyType isEqualToString:@"i"] || // int
//               [propertyType isEqualToString:@"I"] || // unsigned int
//               [propertyType isEqualToString:@"s"] || // short
//               [propertyType isEqualToString:@"S"] || // unsigned short
//               [propertyType isEqualToString:@"l"] || // long
//               [propertyType isEqualToString:@"L"] || // usigned long
//               [propertyType isEqualToString:@"q"] || // long long
//               [propertyType isEqualToString:@"Q"] || // unsigned long long
//               [propertyType isEqualToString:@"B"] ||   // bool or _Bool
//               [propertyType isEqualToString:@"c"] ||	// char
//               [propertyType isEqualToString:@"C"] || // unsigned char
//               [propertyType hasPrefix:@"@\"NSString\""]       ||   // Object
//               [propertyType isEqualToString:@"f"] || // float
//               [propertyType isEqualToString:@"d"]    // double
//               ){
//                [propertyNamesArr addObject:propertyName];
//            }
//        }
//    }else{
//        NSLog(@"warning:类'%@'中没有属性",[self className]);
//    }
//    
//    free(properties);
//    return propertyNamesArr;
//}
//
//-(NSDictionary *)propertyParams{
//    NSMutableDictionary *propertyParamsArr=[[NSMutableDictionary new] autorelease];
//    unsigned int outCount;
//    objc_property_t * const properties=class_copyPropertyList([self class], &outCount);
//    if(outCount>0){
//        for(int i=outCount-1;i>=0;i--){
//            NSString *propertyName = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding];
//            id propertyValue=[self valueForKey:propertyName];
////            NSLog(@"property:%@  value:%@",propertyName,propertyValue);
//            NSString *propertyType;
//            NSString *attrs = [NSString stringWithUTF8String: property_getAttributes(properties[i])];
//            if ([attrs rangeOfString:@",R,"].location == NSNotFound){
//                NSArray *attrParts = [attrs componentsSeparatedByString:@","];
//                if (attrParts != nil){
//                    if ([attrParts count] > 0){
//                        propertyType = [[attrParts objectAtIndex:0] substringFromIndex:1];
//                    }
//                }
//            }
//            
//            if((NSNull *)propertyValue==[NSNull null] || propertyValue==nil || propertyValue==NULL){
//                [propertyParamsArr setObject:[NSNull null] forKey:propertyName];
//            }else{
//                if([propertyType isEqualToString:@"i"] || // int
//                   [propertyType isEqualToString:@"I"] || // unsigned int
//                   [propertyType isEqualToString:@"s"] || // short
//                   [propertyType isEqualToString:@"S"] || // unsigned short
//                   [propertyType isEqualToString:@"l"] || // long
//                   [propertyType isEqualToString:@"L"] || // usigned long
//                   [propertyType isEqualToString:@"q"] || // long long
//                   [propertyType isEqualToString:@"Q"] || // unsigned long long
//                   [propertyType isEqualToString:@"B"]    // bool or _Bool
//                   ){
//                    [propertyParamsArr setObject:[[[DaoIntNumber alloc] initWithLong:[propertyValue longLongValue]] autorelease] forKey:propertyName];
//                    
//                }else if([propertyType isEqualToString:@"f"] || // float
//                         [propertyType isEqualToString:@"d"]    // double
//                         ){
//                    [propertyParamsArr setObject:[[[DaoDoubleNumber alloc] initWithDouble:[propertyValue doubleValue]] autorelease] forKey:propertyName];
//                    
//                }else if([propertyType isEqualToString:@"c"] ||	// char
//                         [propertyType isEqualToString:@"C"] || // unsigned char
//                         [propertyType hasPrefix:@"@"]          // Object
//                         ){
//                    [propertyParamsArr setObject:propertyValue forKey:propertyName];
//                }
//            } 
////            NSLog(@"propertyParams:%@",[propertyParamsArr objectForKey:propertyName]);
//        }
//        if([propertyParamsArr count]==0){
//            NSLog(@"warning:类'%@'中无属性或无支持的属性.请确保类已声明创建.目前'propertyParams'方法支持的类型如下:\n int,unsigned int,long,usigned long,long long,unsigned long long,short,unsigned short,bool,Bool,float,double,char,unsigned char,NSString",[self className]);
//        }
//    }else{
//        NSLog(@"warning:无法从类'%@'中读取属性.",[self className]);
//    }
//    
//    free(properties);
//    return propertyParamsArr;
//}
//
//-(NSDictionary *)propertyTypes{
//    NSMutableDictionary *propertyTypeArr=[[NSMutableDictionary new] autorelease];
//    unsigned int outCount;
//    objc_property_t * const properties=class_copyPropertyList([self class], &outCount);
//    if(outCount>0){
//        for(int i=outCount-1;i>=0;i--){
//            NSString *propertyName = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding];
//            NSString *propertyType;
//            NSString *attrs = [NSString stringWithUTF8String: property_getAttributes(properties[i])];
//            if ([attrs rangeOfString:@",R,"].location == NSNotFound){
//                NSArray *attrParts = [attrs componentsSeparatedByString:@","];
//                if (attrParts != nil){
//                    if ([attrParts count] > 0){
//                        propertyType = [[attrParts objectAtIndex:0] substringFromIndex:1];
//                    }
//                }
//            }
//            if([propertyType isEqualToString:@"i"] || // int
//               [propertyType isEqualToString:@"I"] || // unsigned int
//               [propertyType isEqualToString:@"s"] || // short
//               [propertyType isEqualToString:@"S"] || // unsigned short
//               [propertyType isEqualToString:@"l"] || // long
//               [propertyType isEqualToString:@"L"] || // usigned long
//               [propertyType isEqualToString:@"q"] || // long long
//               [propertyType isEqualToString:@"Q"] || // unsigned long long
//               [propertyType isEqualToString:@"B"]    // bool or _Bool
//               ){
//                [propertyTypeArr setObject:@"INTEGER" forKey:propertyName];
//            }else if([propertyType isEqualToString:@"f"] || // float
//                     [propertyType isEqualToString:@"d"]    // double
//                     ){
//                [propertyTypeArr setObject:@"REAL" forKey:propertyName];
//                
//            }else if([propertyType isEqualToString:@"c"] ||	// char
//                     [propertyType isEqualToString:@"C"] || // unsigned char
//                     [propertyType hasPrefix:@"@"]          // Object
//                     ){
//                [propertyTypeArr setObject:@"TEXT" forKey:propertyName];
//            }
//        }
//        if([propertyTypeArr count]==0){
//            NSLog(@"warning:类'%@'中无属性或无支持的属性.请确保类已声明创建.目前'propertyParams'方法支持的类型如下:\n int,unsigned int,long,usigned long,long long,unsigned long long,short,unsigned short,bool,Bool,float,double,char,unsigned char,NSString",[self className]);
////            NSLog(@"warning %@:no properties support or no property value,make sure this class has been initialized,and propertyParams method only support following types:\n int,unsigned int,long,usigned long,long long,unsigned long long,short,unsigned short,bool,Bool,float,double,char,unsigned char,string",[self className]);
//        }
//    }else{
//        NSLog(@"warning:无法从类'%@'中读取属性.",[self className]);
////        NSLog(@"warning:can't get properties from class '%@'.",[self className]);
//    }
//    
//    free(properties);
//    return propertyTypeArr;
//}
//
//@end
//
////-(NSDictionary *) allProperties{
////    if (dic==nil) {
////        dic=[[NSMutableDictionary new] autorelease];
////        unsigned int outCount;
////        objc_property_t * const properties=class_copyPropertyList([self class], &outCount);
////        if(outCount>0){
////            NSMutableArray *propertyNameArr=[NSMutableArray new];
////            NSMutableArray *propertyValueArr=[NSMutableArray new];
////            NSMutableArray *propertyTypeArr=[NSMutableArray new];
////            for(int i=outCount-1;i>=0;i--){
////                NSString *propertyName = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding];
////                id propertyValue=[self valueForKey:propertyName];
////                NSString *propertyType;
////                NSString *attrs = [NSString stringWithUTF8String: property_getAttributes(properties[i])];
////                if ([attrs rangeOfString:@",R,"].location == NSNotFound)
////                {
////                    NSArray *attrParts = [attrs componentsSeparatedByString:@","];
////                    if (attrParts != nil)
////                    {
////                        if ([attrParts count] > 0)
////                        {
////                            propertyType = [[attrParts objectAtIndex:0] substringFromIndex:1];
////                        }
////                    }
////                }
////                NSLog(@"propertyType:%@",propertyType);
////                NSLog(@"propertyName:%@",propertyName);
////                NSLog(@"propertyValue:%@ \n\n",propertyValue);
////                if([propertyType hasPrefix:@"i"] || // int
////                   [propertyType hasPrefix:@"I"] || // unsigned int
////                   [propertyType hasPrefix:@"l"] || // long
////                   [propertyType hasPrefix:@"L"] || // usigned long
////                   [propertyType hasPrefix:@"q"] || // long long
////                   [propertyType hasPrefix:@"Q"] || // unsigned long long
////                   [propertyType hasPrefix:@"s"] || // short
////                   [propertyType hasPrefix:@"S"] || // unsigned short
////                   [propertyType hasPrefix:@"B"] || // bool or _Bool
////                   [propertyType hasPrefix:@"f"] || // float
////                   [propertyType hasPrefix:@"d"] ||  // double
////                   [propertyType hasPrefix:@"c"] ||	// char
////                   [propertyType hasPrefix:@"C"] ||   // unsigned char
////                   [propertyType hasPrefix:@"@"]){          // string
////                    [propertyNameArr addObject:propertyName];
////                    if (propertyValue==nil) {
////                        propertyValue=@"";
////                    }
////                    [propertyValueArr addObject:propertyValue]; 
////                    [propertyTypeArr addObject:propertyType];
////                }
////            }
////            if([propertyNameArr count]==0){
////                NSLog(@"warning %@:no properties support, allProperties method only support following types:\n int,unsigned int,long,usigned long,long long,unsigned long long,short,unsigned short,bool,Bool,float,double,char,unsigned char,string",[self className]);
////            }
////            [dic setObject:propertyNameArr forKey:PROPERTY_NAME_ARR];
////            [dic setObject:propertyValueArr forKey:PROPERTY_VALUE_ARR];
////            [dic setObject:propertyTypeArr forKey:PROPERTY_TYPE_ARR];
////            [propertyNameArr release];
////            [propertyValueArr release];
////            [propertyTypeArr release];
////        }else{
////            NSLog(@"warning %@:no properties in this class.",[self className]);
////        }
////        
////        free(properties);
////    }
////    return dic;
////}
//
//
////
////-(NSDictionary *) validProperties{
////    NSMutableDictionary *dic=[[NSMutableDictionary new] autorelease];
////    unsigned int outCount;
////    objc_property_t * const properties=class_copyPropertyList([self class], &outCount);
////    if(outCount>0){
////        NSMutableArray *propertyNameArr=[NSMutableArray new];
////        NSMutableArray *propertyValueArr=[NSMutableArray new];
////        NSMutableArray *propertyTypeArr=[NSMutableArray new];
////        for(int i=outCount-1;i>=0;i--){
////            NSString *propertyName = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding];
////            id propertyValue=[self valueForKey:propertyName];
////            NSString *propertyType;
////            NSString *attrs = [NSString stringWithUTF8String: property_getAttributes(properties[i])];
////            if ([attrs rangeOfString:@",R,"].location == NSNotFound)
////            {
////                NSArray *attrParts = [attrs componentsSeparatedByString:@","];
////                if (attrParts != nil)
////                {
////                    if ([attrParts count] > 0)
////                    {
////                        propertyType = [[attrParts objectAtIndex:0] substringFromIndex:1];
////                    }
////                }
////            }
////            NSLog(@"propertyType:%@",propertyType);
////            NSLog(@"propertyName:%@",propertyName);
////            NSLog(@"propertyValue:%@ \n\n",propertyValue);
////            if(([propertyType hasPrefix:@"i"] ||    // int
////               [propertyType hasPrefix:@"I"] ||     // unsigned int
////               [propertyType hasPrefix:@"l"] ||     // long
////               [propertyType hasPrefix:@"L"] ||     // usigned long
////               [propertyType hasPrefix:@"q"] ||     // long long
////               [propertyType hasPrefix:@"Q"] ||     // unsigned long long
////               [propertyType hasPrefix:@"s"] ||     // short
////               [propertyType hasPrefix:@"S"] ||     // unsigned short
////               [propertyType hasPrefix:@"B"] ||     // bool or _Bool
////               [propertyType hasPrefix:@"f"] ||     // float
////               [propertyType hasPrefix:@"d"] ||     // double
////               [propertyType hasPrefix:@"c"] ||     // char
////               [propertyType hasPrefix:@"C"] ||     // unsigned char
////               [propertyType hasPrefix:@"@"]) &&    // string
////               (NSNull *)propertyValue!=[NSNull null] && propertyValue!=nil){//has value
////                [propertyNameArr addObject:propertyName];
////                [propertyValueArr addObject:propertyValue]; 
////                [propertyTypeArr addObject:propertyType];
////            }
////        }
////        if([propertyNameArr count]==0){
////            NSLog(@"warning %@:no properties support or no property value,make sure this class has been initialized,and validProperties method only support following types:\n int,unsigned int,long,usigned long,long long,unsigned long long,short,unsigned short,bool,Bool,float,double,char,unsigned char,string",[self className]);
////        }
////        [dic setObject:propertyNameArr forKey:PROPERTY_NAME_ARR];
////        [dic setObject:propertyValueArr forKey:PROPERTY_VALUE_ARR];
////        [dic setObject:propertyTypeArr forKey:PROPERTY_TYPE_ARR];
////        [propertyNameArr release];
////        [propertyValueArr release];
////        [propertyTypeArr release];
////    }else{
////        NSLog(@"warning %@:no properties in this class.",[self className]);
////    }
////    
////    free(properties);
////    return dic;
////}
//
//
