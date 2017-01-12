//
//  ViewController.m
//  AutoLayout
//
//  Created by Jack on 15/8/26.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *jumpButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    jumpButton.center = self.view.center;
    
    [self.view addSubview:jumpButton];
    [jumpButton addTarget:self action:@selector(jumpToNextViewController) forControlEvents:UIControlEventTouchUpInside];
    
//    UIPageViewController

    UIViewController *viewController = [[UIViewController alloc] init];
    
    NSLog(@"viewController---------%@", viewController);
    
    
    
    
}
- (void)jumpToNextViewController{
    TestViewController *testViewController = [[TestViewController alloc] init];
    [self presentViewController:testViewController animated:NO completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
