//
//  ViewController.m
//  CoreImageQRCode
//
//  Created by Jack on 15/9/6.
//  Copyright (c) 2015年 Jack. All rights reserved.
//

#import "ViewController.h"
#import "CIFilterEffect.h"

@interface ViewController ()

@property (nonatomic, strong)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(70, 200, 240, 240)];
//    _imageView.backgroundColor = [UIColor greenColor];
    
    CIFilterEffect *filterEffect = [[CIFilterEffect alloc] init];
//    filterEffect = [filterEffect initWithQRCodeString:@"www.baidu.com" width:180];
    filterEffect = [filterEffect initWithImage:[UIImage imageNamed:@"Wechat"] filterName:@"Wechat HI"];
//    _imageView.image = filterEffect.QRCodeImage;
    _imageView.image = filterEffect.filterImage;
    [self.view addSubview:_imageView];
    
    
    
}



@end
