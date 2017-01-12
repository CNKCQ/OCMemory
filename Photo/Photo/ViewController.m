//
//  ViewController.m
//  Photo
//
//  Created by Jack on 15/7/29.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *photoButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 30)];
    [photoButton setTitle:@"photo" forState:UIControlStateNormal];
    self.view.center = photoButton.center;
    [photoButton addTarget:self action:@selector(photo) forControlEvents:UIControlEventTouchUpInside];
    photoButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:photoButton];
    


}

- (void)photo{
    // get image from photo album
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        UIImagePickerController *imagePickController = [[UIImagePickerController alloc] init];
    imagePickController.delegate = self;
    imagePickController.sourceType = sourceType;
    imagePickController.allowsEditing = YES;
    [self presentViewController:imagePickController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
