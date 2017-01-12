//
//  TOLApplication.m
//  TimeOutLogout
//
//  Created by Jack on 15/7/28.
//  Copyright (c) 2015年 Jack. All rights reserved.
//

#import "TOLApplication.h"

@implementation TOLApplication

- (void)sendEvent:(UIEvent *)event
{
    [super sendEvent:event];
    // Fire up the timer upon first event
    if (!_tolTimer) {
        [self resetTolTimer];
    }
    
    // Check to see if there was a touch event
    NSSet *allTouches = [event allTouches];
    if ([allTouches count] > 0) {
        UITouchPhase phase = ((UITouch *)[allTouches anyObject]).phase;
        if (phase == UITouchPhaseBegan) {
            [self resetTolTimer];
        }
    }
    NSLog(@"allTouches count == %ld",[allTouches count]);
}

- (void)resetTolTimer{
    if (_tolTimer) {
        [_tolTimer invalidate];
    }
    // Schedule a timer to fire in kApplicationTimeoutInMinutes * 60
    int timeout = ApplicationTimeOutInMinutes * 2;
    _tolTimer = [NSTimer scheduledTimerWithTimeInterval:timeout target:self selector:@selector(tolTimerExceeded) userInfo:nil repeats:NO];
}
/**
 *  Post a notification so anyone who subscribes to it can be notified when
 *  the application times out
 */
- (void)tolTimerExceeded{
    [[NSNotificationCenter defaultCenter] postNotificationName:ApplicationDidTimeOutNotification object:nil];
}

- (void) dealloc{

}
@end
