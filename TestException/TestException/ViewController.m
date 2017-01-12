//
//  ViewController.m
//  TestException
//
//  Created by Jack on 15/10/6.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testNSException];
}
- (void)testNSException{
    
    NSArray *array = @[@""];
    NSLog(@"array--test--%@",array[1]);
}

@end
