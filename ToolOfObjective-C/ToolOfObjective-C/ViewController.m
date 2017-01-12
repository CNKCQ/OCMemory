//
//  ViewController.m
//  ToolOfObjective-C
//
//  Created by Jack on 15/10/26.
//  Copyright © 2015年 Jack. All rights reserved.
//
#define filePath @"/Users/Jack/Documents"
#import "ViewController.h"
#import "UtilTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *filename = [UtilTools getFileNameListOfType:@"jpg" fromDirectoryPath:filePath];
    NSInteger count = filename.count;
    NSLog(@"I have %ld books in DocumentsDir",(long)count);
    for (int i = 0; i<count; i++) {
        NSLog(@"NO.%d is %@",i+1,[filename objectAtIndex:i]);
    }
    
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:filePath error:nil];
    NSLog(@"files---%@",files);
}

@end
