//
//  ViewController.m
//  TellMe
//
//  Created by Jack on 15/10/1.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"self----%@",[self class]);
    NSLog(@"_cmd----%@",NSStringFromSelector(_cmd));
    NSLog(@"function----%s",__func__);
    NSLog(@"super----%@",[super class]);
    
    CALayer;
    
    NSArray *arr = [NSArray array];
    Class cls = [arr class];
    int i = 0;
    
    while (1) {
        NSLog(@"%d---cls:%p---nsobject:%p", i, cls,objc_getMetaClass("NSObject"));
        
        i++;
        if (cls == objc_getMetaClass("NSObject")) break;
        
//        cls = object_getClass(cls);
//        cls = object_getClassName(cls);

        
    }
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
