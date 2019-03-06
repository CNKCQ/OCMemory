//
//  ViewController.m
//  Runtime
//
//  Created by Jack on 15/11/3.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) NSMutableDictionary *testDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSObject *object = [NSObject new];
    NSLog(@"retainCount: %@", [object valueForKey:@"retainCount"]);
    self.testDic = [NSMutableDictionary dictionary];
    [self.testDic setObject:object forKey:@"key"];
    NSLog(@"retainCount: %@", [object valueForKey:@"retainCount"]);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSObject *object = [self.testDic objectForKey:@"key"];
    [self.testDic removeObjectForKey:@"key"];
    NSLog(@"retainCount: %@", [object valueForKey:@"retainCount"]);
}



@end
