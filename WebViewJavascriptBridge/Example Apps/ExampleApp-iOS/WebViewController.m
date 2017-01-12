//
//  WebViewController.m
//  ExampleApp-iOS
//
//  Created by Jack on 15/7/26.
//  Copyright (c) 2015年 Marcus Westin. All rights reserved.
//

#import "WebViewController.h"
#import "WebViewJavascriptBridge.h"

@interface WebViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@property WebViewJavascriptBridge *bridge;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_webView];
    
    _webView.delegate = self;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(240, 20, 40, 25);
    backButton.layer.cornerRadius = 2;
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    [backButton setTitle:@"go" forState:UIControlStateHighlighted];
    [backButton setBackgroundColor:[UIColor orangeColor]];
    [backButton addTarget:self action:@selector(back2LastPage) forControlEvents:UIControlEventTouchUpInside];
    
    [_webView addSubview:backButton];

    
    if (_bridge) {
        return;
    }
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
//    [self loadExamplePage:_webView];
    
//    _bridge = [WebViewJavascriptBridge bridgeForWebView:_webView handler:nil];

    
    _bridge = [WebViewJavascriptBridge bridgeForWebView:_webView webViewDelegate:self handler:^(id data, WVJBResponseCallback responseCallback) {/**< 可以接收从js发送过来的消息 并返回相应的数据 */
//        NSLog(@"%@", data);
//        responseCallback(@"美女回答: 讨厌------啦");
        }];
    
        NSString *string = @"嗨，先生";
   
        [_bridge send:string responseCallback:^(id responseData) {/**< 可以发送给就是消息，并获取js返回的数据 */
    
//            NSLog(@"美女召唤---%@",string);
    
//            NSLog(@"%@",responseData);
        }];
    
        [_bridge registerHandler:@"先生" handler:^(id data, WVJBResponseCallback responseCallback) {
        
        NSLog(@"有美女问 先生 --%@",data);
        NSString *string = @"我是喜欢你的";
        responseCallback(string);
        }];
    
        NSString *sti = @"今晚约吗？";
        [_bridge callHandler:@"美女" data:sti responseCallback:^(id responseData) {
            NSLog(@"先生问美女:%@",sti);
            NSLog(@"%@",responseData);
        }];
    

    
}


- (void)bridgeOc2Js{
   
}

- (void)loadExamplePage:(UIWebView*)webView {
    NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"/Source/ExampleApp" ofType:@"html"];
    NSString* appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
    [webView loadHTMLString:appHtml baseURL:baseURL];
}

#pragma mark - delegate for webView
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"request == %@/nnavigationType == %ld",request,(long)navigationType);
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"WebViewJavascript.js" ofType:@"txt"];
    NSString *js = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [webView stringByEvaluatingJavaScriptFromString:js];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
#pragma mark - custom method
- (void)back2LastPage{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
