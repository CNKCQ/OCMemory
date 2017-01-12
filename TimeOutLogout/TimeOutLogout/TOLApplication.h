//
//  TOLApplication.h
//  TimeOutLogout
//
//  Created by Jack on 15/7/28.
//  Copyright (c) 2015年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ApplicationTimeOutInMinutes 1

#define ApplicationDidTimeOutNotification @"ApplicationDidTimeOut"
/**
 *  This is a subclass of UIApplication with the sendEvent: method
 *  overridden in order to catch all touch events
 */
@interface TOLApplication : UIApplication{
    NSTimer *_tolTimer;
}
/**
 *  Resets the tolTimer to its initial state. this method gets called 
 *  every time there is a touch on the screen. It should also be called
 *  when the user correctly enters their pin to access the application
 */
- (void)resetTolTimer;
@end
