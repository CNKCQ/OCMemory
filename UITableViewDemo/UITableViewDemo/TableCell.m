//
//  TableCell.m
//  UITableViewDemo
//
//  Created by Jack on 16/2/28.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addUI];
    }
    return self;
}
- (void)addUI{
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
    _imgView.clipsToBounds = YES;
    [self addSubview:_imgView];
    
    _discLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imgView.frame) + 10, 20, 200, 40)];
    [self addSubview:_discLabel];
    
    
}
@end
