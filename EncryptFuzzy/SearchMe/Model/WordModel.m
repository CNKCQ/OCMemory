//
//  WordModel.m
//  SearchMe
//
//  Created by Jack on 16/3/12.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "WordModel.h"

@implementation WordModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dictionary];

    }
    return self;
}

- (id)valueForUndefinedKey:(NSString *)key{return nil;}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (void)setNilValueForKey:(NSString *)key{}

@end
