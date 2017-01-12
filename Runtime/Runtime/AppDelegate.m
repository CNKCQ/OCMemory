//
//  AppDelegate.m
//  Runtime
//
//  Created by Jack on 15/11/3.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"
#import <Foundation/Foundation.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Person *person = [[Person alloc] init];
    
    [person setValue:nil forKey:@"age"];
    [Person propertyKeys];
    
    
    return YES;
}



@end
