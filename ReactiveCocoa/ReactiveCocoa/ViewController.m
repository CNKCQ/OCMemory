//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by Jack on 16/2/20.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"
#import "BlueView.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic)  BlueView *blueView;
@property (weak, nonatomic)  UILabel *label;
@property (strong, nonatomic)  UITextField *textField1;
@property (strong, nonatomic)  UITextField *textField2;
@property (strong, nonatomic)  UIButton *button;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(40, 200, 300, 40)];
    _textField1.borderStyle = UITextBorderStyleRoundedRect;
    
    _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(40, 250, 300, 40)];
    _textField2.borderStyle = UITextBorderStyleRoundedRect;
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    _button.frame = CGRectMake(CGRectGetMinX(_textField2.frame), CGRectGetMaxY(_textField2.frame)+2, 300, 40);
    _button.backgroundColor = [UIColor greenColor];
    [_button setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:_button];
    [self.view addSubview:_textField1];
    [self.view addSubview:_textField2];
    
    //1.替代代理监听按钮点击
//    [[_blueView rac_signalForSelector:@selector(redButton:)] subscribeNext:^(id x) {
//        NSLog(@"我知道你点击了红色的按钮");
//    }];
    //2.监听事件
    [[_blueView.redButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"监听成功了 -- %@",x);
    }];
    //3.KVO
    [[_blueView rac_valuesAndChangesForKeyPath:@"num" options:NSKeyValueObservingOptionNew observer:nil] subscribeNext:^(id x) {
        NSLog(@"_blueView.num %@",x);
    }];
    
    //4.替代通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(id x) {
        NSLog(@"键盘弹出来了");
    }];
    
    //5.监听文本框文字改变
    @weakify(self);
     [[_textField1 rac_textSignal] subscribeNext:^(id x) {
        @strongify(self);
        NSLog(@"我输入-%@-%@",x,self);
    }];
    
    //6.处理多个请求，都返回结果的时候，统一做处理
    RACSignal *request1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"请求一");
        
        return nil;
    }];
    RACSignal *request2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"请求二");
        
        return nil;
        
    }];
    [self rac_liftSelector:@selector(updateUIWithR1:r2:) withSignalsFromArray:@[request1,request2]] ;
    
    [RACObserve(self.view, center) subscribeNext:^(id x) {
        
        NSLog(@"我的中心点");
    }];
    RAC(self.label,text) = _textField1.rac_textSignal;
    
//    NSCParameterAssert(block != nil);

//    NSParameterAssert(self.textField.text == @"h");
    
    NSCParameterAssert(_textField1.text != nil);
    
    RACSignal *valid = [RACSignal combineLatest:@[_textField1.rac_textSignal,_textField2.rac_textSignal] reduce:^(NSString *account,NSString *password){
        
        return @(account.length > 0 && password.length > 0);
    }];
    
    RAC(_button,enabled) = valid;
    RAC(_button, alpha ) = [valid map:^(NSNumber *n){
        
        return n.boolValue? @1 : @0.4;
    }];
    
    
//    if (!valid) {
//        _button.backgroundColor = [UIColor lightGrayColor];
//    }else{
//        _button.backgroundColor = [UIColor blueColor];
//
//    }
    
    
    
    
}

// 更新UI
- (void)updateUIWithR1:(id)data r2:(id)data1
{
    NSLog(@"更新UI%@  %@",data,data1);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.blueView.num++;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
