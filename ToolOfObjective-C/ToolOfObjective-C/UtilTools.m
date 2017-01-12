//
//  UtilTools.m
//  ToolOfObjective-C
//
//  Created by Jack on 15/10/26.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "UtilTools.h"

@implementation UtilTools

+(NSArray *)getFileNameListOfType:(NSString *)type fromDirectoryPath:(NSString *)dirPath{
    
    NSMutableArray *fileNameList = [NSMutableArray array];
    NSArray *tempList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dirPath error:nil];
    for (NSString *fileName in tempList) {
        
        NSString *fullPath = [dirPath stringByAppendingPathComponent:fileName];
        if ([self isFileExistAtPath:fullPath]) {
            if ([[fileName pathExtension] isEqualToString:type]) {
                [fileNameList addObject:fileName];
            }
            
        }
    }
    
    return fileNameList;
}
+ (Boolean)isFileExistAtPath:(NSString *)fileFullPath{
    Boolean isExist = NO;
    isExist = [[NSFileManager defaultManager] fileExistsAtPath:fileFullPath];
    return isExist;
}
@end
