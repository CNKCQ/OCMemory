//
//  ViewController.m
//  TimeOutLogout
//
//  Created by Jack on 15/7/28.
//  Copyright (c) 2015年 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"登录后的页面";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *alertButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    alertButton.center = self.view.center;
    alertButton.backgroundColor = [UIColor blueColor];
    [alertButton setTitle:@"didLogin" forState:UIControlStateNormal];
    [self.view addSubview:alertButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
