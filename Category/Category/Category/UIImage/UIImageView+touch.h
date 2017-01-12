//
//  UIImageView+touch.h
//  CCBClientV2
//
//  Created by 李建华 on 13-11-23.
//  Copyright (c) 2013年 llbt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (touch)
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
@end
