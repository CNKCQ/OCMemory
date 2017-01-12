//
//  CIFilterEffect.h
//  CoreImageQRCode
//
//  Created by Jack on 15/9/6.
//  Copyright (c) 2015年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CIFilterEffect : NSObject

@property (nonatomic, strong, readonly) UIImage *filterImage;

- (instancetype)initWithImage:(UIImage *)image filterName:(NSString *)name;

@property (nonatomic, strong, readonly) UIImage *QRCodeImage;

- (instancetype)initWithQRCodeString:(NSString *)string width:(CGFloat)width;

@end
