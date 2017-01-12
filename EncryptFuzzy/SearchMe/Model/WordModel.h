//
//  WordModel.h
//  SearchMe
//
//  Created by Jack on 16/3/12.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordModel : NSObject
/**关键字*/
@property (nonatomic, copy)NSString *keyWord;
/**释义*/
@property (nonatomic, copy)NSString *translation;
/**释义*/
@property (nonatomic, copy)NSString *weight;
/**分页计数*/
@property (nonatomic, copy)NSString *page;

/**初始化模型*/
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
