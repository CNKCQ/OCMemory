//
//  UtilTools.h
//  ToolOfObjective-C
//
//  Created by Jack on 15/10/26.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilTools : NSObject
/**
 *  获得指定目录下指定后缀名的文件列表
 *
 *  @param type    文件名后缀
 *  @param dirPath 指定目录
 *
 *  @return 文件名列表
 */
+(NSArray *)getFileNameListOfType:(NSString *)type fromDirectoryPath:(NSString *)dirPath;
@end
