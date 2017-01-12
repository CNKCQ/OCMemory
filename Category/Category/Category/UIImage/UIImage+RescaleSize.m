//
//  UIImage+RescaleSize.m
//  kuaixian
//
//  Created by Boter on 5/13/14.
//  Copyright (c) 2014 Jack_wang. All rights reserved.
//

#import "UIImage+RescaleSize.h"

@implementation UIImage (RescaleSize)

- (UIImage *)rescaleImageToSize:(CGSize)size {
    
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    [self drawInRect:rect];  // scales image to rect
    
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resImage;
    
}
@end
