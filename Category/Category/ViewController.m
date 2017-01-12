//
//  ViewController.m
//  Category
//
//  Created by Jack on 15/7/31.
//  Copyright (c) 2015年 Jack. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Layout.h"
#import "NSObject+NotNull.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    
    [array addObject:[NSNull null]];
    [dic setObject:[NSNull null] forKey:[NSNull null]];
    
    [set addObject:[NSNull null]];
    [array addObject:[NSNull null]];
    [set addObject:@""];
//    if (array.count > 0) {
//        NSLog(@"array - %@",array);
//    }
//    
//    if ([dic allKeys].count > 0) {
//        NSLog(@"dic - %@",dic);
//    }
//    
//    if (set.count > 0) {
//        NSLog(@"set - %@",set);
//    }
    
    if ([array isNotEmpty]) {
        NSLog(@"array - %@",array);
    }
    
    if ([dic isNotEmpty]) {
        NSLog(@"dic - %@",dic);
    }
    
    if ([set isNotEmpty]) {
        NSLog(@"set - %@",set);
    }

}


@end
