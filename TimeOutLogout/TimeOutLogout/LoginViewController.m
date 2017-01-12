//
//  LoginViewController.m
//  TimeOutLogout
//
//  Created by Jack on 15/7/28.
//  Copyright (c) 2015年 Jack. All rights reserved.
//

#import "LoginViewController.h"
#import "TOLApplication.h"

@implementation LoginViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录界面";
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    loginButton.center = self.view.center;
    loginButton.backgroundColor = [UIColor greenColor];
    [loginButton setTitle:@"login" forState:UIControlStateNormal];
    [self.view addSubview:loginButton];
    [loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)login:(UIButton *)button{
    [((TOLApplication *)[UIApplication sharedApplication]) resetTolTimer];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
