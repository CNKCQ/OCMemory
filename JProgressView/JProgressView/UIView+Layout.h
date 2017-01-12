//
//  UIView+Layout.h
//  Category
//
//  Created by Jack on 15/7/31.
//  Copyright (c) 2015年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layout)
@property (assign, nonatomic) CGFloat x;/**< 返回View的X值 */
@property (assign, nonatomic) CGFloat y;/**< 返回View的Y值 */
@property (assign, nonatomic) CGFloat width;/**< 返回View的Width值 */
@property (assign, nonatomic) CGFloat height;/**< 返回View的Hei值 */
@property (assign, nonatomic) CGSize size;/**< 返回View的Size值 */
@property (assign, nonatomic) CGPoint origin;/**< 返回View的Origin值 */
@property (nonatomic ,assign) CGFloat centerX;/**< centerX值*/
@property (nonatomic ,assign) CGFloat centerY;/**< centerY值*/
@end
