//
//  UIImage+Resize.m
//  CCBClient
//
//  Created by dyj on 10-10-11.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UIImage+Resize.h"
#import <UIKit/UIKit.h>


@implementation UIImage(Resize)

- (UIImage *)imageScaledToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
