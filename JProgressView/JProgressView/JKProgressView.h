//
//  JKProgressView.h
//  kuaixian
//
//  Created by Jack on 15/11/25.
//  Copyright © 2015年 Jack_wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface JKProgressView : UIView

@property (nonatomic, assign)CGFloat times;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray *datas;
@property (nonatomic, copy) NSDictionary *dic;
@property (nonatomic, assign,setter=isNew:)Boolean new;

-(instancetype)initProgressWithFrame:(CGRect)frame times:(CGFloat)times;

@end
