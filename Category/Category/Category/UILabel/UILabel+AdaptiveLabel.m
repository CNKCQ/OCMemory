//
//  UILabel+AdaptiveLabel.m
//  kuaixian
//
//  Created by zuoyinbin on 14-9-2.
//  Copyright (c) 2014年 Jack_wang. All rights reserved.
//

#import "UILabel+AdaptiveLabel.h"

@implementation UILabel (AdaptiveLabel)

- (CGRect)horizontalAdaptiveText:(NSString *)text Font:(UIFont *)font
{
    CGSize size = [text sizeWithFont:font];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
    return self.frame;
}

- (CGRect)verticalAdaptiveText:(NSString *)text Font:(UIFont *)font
{
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(self.frame.size.width,MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
    return self.frame;
}

@end
