//
//  main.m
//  TimeOutLogout
//
//  Created by Jack on 15/7/28.
//  Copyright (c) 2015年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TOLApplication.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {

        return UIApplicationMain(argc, argv,
                                
                                NSStringFromClass(
                                                  
                                                  [TOLApplication class]),
                                
                                NSStringFromClass(
                                                  
                                                  [AppDelegate class]));
    }
}
