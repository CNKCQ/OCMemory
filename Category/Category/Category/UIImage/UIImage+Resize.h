//
//  UIImage+Resize.h
//  CCBClient
//
//  Created by dyj on 10-10-11.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIImage(Resize)

/*
 参数 size：要求图片大小
 返回：该图片在指定size下的图片信息
 
 根据传入的size，重新绘制该图片信息，获得一个在指定size下的图片信息
 */
- (UIImage *)imageScaledToSize:(CGSize)size;

@end
