//
//  DataTool.h
//  SearchMe
//
//  Created by Jack on 16/3/12.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sigleton.h"

@class WordModel;
@interface DataTool : NSObject

DEF_SIGLETON(DataTool)

- (NSArray *)queryWordsFromKeyWord:(NSString *)keyWord page:(NSString *)page;

- (void)addWord:(WordModel *)word;

@end
