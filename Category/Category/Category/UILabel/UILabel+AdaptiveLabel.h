//
//  UILabel+AdaptiveLabel.h
//  kuaixian
//
//  Created by zuoyinbin on 14-9-2.
//  Copyright (c) 2014年 Jack_wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AdaptiveLabel)

- (CGRect)horizontalAdaptiveText:(NSString*)text Font:(UIFont*)font;
- (CGRect)verticalAdaptiveText:(NSString*)text Font:(UIFont*)font;

@end
