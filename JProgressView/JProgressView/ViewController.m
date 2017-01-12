//
//  AllPayGenerateQRCodeController.m
//  kuaixian
//
//  Created by Jack on 15/9/6.
//  Copyright (c) 2015年 Jack_wang. All rights reserved.
//
#define View_Background_Color [UIColor lightGrayColor]
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define PROGROSSMINUTES 1
#define PADDING 10
#define QRHEIGHT 300
#import <CoreImage/CoreImage.h>
#import "UIView+Layout.h"
#import "ViewController.h"
#import "JKProgressView.h"
#import "Person.h"

@interface ViewController ()<UIAlertViewDelegate>{

}

@property (nonatomic, strong) UIImageView *QRCodeImageView;
@property (nonatomic, strong) UIImageView *barcodeView;
@property (nonatomic, strong) UILabel *barcodeLabel;
@property (nonatomic, assign) float thetime;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"宝岛支付";
    
//    JKProgressView *progressView = [[JKProgressView alloc] initWithFrame:CGRectMake(0, 100, WIDTH, 40)];
//    [progressView initProgressWithFrame:progressView.frame times:80];
//    progressView.times = 100;
//    progressView.name = @"Jack";
//    [progressView isNew:YES];
    Person *person = [[Person alloc] init];
    person.times = 100;
    person.name = @"Jack";
    NSArray *arrays = @[@"1"];
    person.datas = arrays;
    [person test];
    [person isNew:YES];

//    progressView.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:progressView];
    
    
}


@end
