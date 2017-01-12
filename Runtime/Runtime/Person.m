//
//  Person.m
//  Runtime
//
//  Created by Jack on 15/11/3.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

- (void)encodeWithCoder:(NSCoder *)encoder{
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    
    for (int i = 0; i < outCount; i ++) {
        
        Ivar ivar = ivars[i];
        
        const char *name = ivar_getName(ivar);
        
        NSString *key = [NSString stringWithUTF8String:name];
        
        id value = [self valueForKey:key];
        
        [encoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)decoder{
 
    if (self = [super init]) {
        
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([Person class], &outCount);
        for (int i = 0; i < outCount; i ++) {
            
            Ivar ivar = ivars[i];
            
            const char *name = ivar_getName(ivar);
            
            NSString *key = [NSString stringWithUTF8String:name];
            
            id value = [decoder decodeObjectForKey:key];
            
            [self setValue:value forKey:key];
            
        }
        free(ivars);
    }
    return self;
}

+ (NSSet *)propertyKeys{
    
    NSMutableSet *keyset = [NSMutableSet set];
    unsigned int  outCount = 0;
    
    objc_property_t *propertyList  = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        
        objc_property_t property = propertyList[i];
        
        [keyset addObject:@(property_getName(property))];
    }
    NSLog(@"keyset---%@",keyset);
    return keyset;
}

- (id)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (void)setNilValueForKey:(NSString *)key{
    
}

- (id)copyWithZone:(NSZone *)zone{
    
//    objc_setAssociatedObject(<#id object#>, <#const void *key#>, <#id value#>, <#objc_AssociationPolicy policy#>)
//    objc_getAssociatedObject(<#id object#>, <#const void *key#>)
    
    return self;
}
@end
