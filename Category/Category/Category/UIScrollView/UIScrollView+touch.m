//
//  UIScrollView+touch.m
//  CCBClientV2
//
//  Created by 李建华 on 13-11-23.
//  Copyright (c) 2013年 llbt. All rights reserved.
//

#import "UIScrollView+touch.h"

@implementation UIScrollView (touch)

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

@end
