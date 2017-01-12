//
//  UIImage+Rounde.h
//  CCBClientV2
//
//  Created by booles on 13-10-22.
//  Copyright (c) 2013年 llbt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rounde)
+ (id) createRoundedRectImage:(UIImage*)image size:(CGSize)size;
- (UIImage *)fixOrientation;
@end
