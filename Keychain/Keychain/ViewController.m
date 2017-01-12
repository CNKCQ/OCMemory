//
//  ViewController.m
//  Keychain
//
//  Created by Jack on 15/11/4.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "ViewController.h"
#import "JUserDataManager.h"

@interface ViewController ()

@property (nonatomic ,copy)NSString *password;
@property (nonatomic ,strong)UITextField *textField;
@property (nonatomic ,strong)UILabel *passwordLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _password = @"";
    
    _passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 180, 25)];
    if ([JUserDataManager readPassWord]) {
            _passwordLabel.text = [NSString stringWithFormat:@"密码为：%@",[JUserDataManager readPassWord]];
    }else{
            _passwordLabel.text = [NSString stringWithFormat:@"密码为：%@",_password];
    }
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(_passwordLabel.frame)+10, 180, 35)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    
    UIButton *setbutton = [[UIButton alloc] initWithFrame:CGRectMake(150, CGRectGetMaxY(_textField.frame)+10, 100, 30)];
    [setbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [setbutton setTitle:@"设置并显示" forState:UIControlStateNormal];
    [setbutton addTarget:self action:@selector(setAndSave) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_passwordLabel];
    [self.view addSubview:_textField];
    [self.view addSubview:setbutton];
    
    
    
}

- (void)setAndSave{
    [JUserDataManager savePassWord:self.textField.text];
    self.passwordLabel.text = [JUserDataManager readPassWord];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
