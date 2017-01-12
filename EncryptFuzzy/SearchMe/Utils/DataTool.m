//
//  DataTool.m
//  SearchMe
//
//  Created by Jack on 16/3/12.
//  Copyright © 2016年 Jack. All rights reserved.
//


#import "DataTool.h"
#import "FMDB.h"
#import "WordModel.h"
#import <sqlite3.h>

NS_INLINE NSString* documentDirectoryPath() {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (!documentsDirectory) {
        return nil;
    }
    return documentsDirectory;
}

@implementation DataTool

static FMDatabase *_db;

IMP_SIGLETON(DataTool)

+ (void)initialize{
    
    NSString *path = [documentDirectoryPath() stringByAppendingPathComponent:@"words.sqlite"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    Boolean dbIsExists = NO;
    if ([manager fileExistsAtPath:path]) {
        dbIsExists = YES;
    }
    _db = [FMDatabase databaseWithPath:path];
    [_db open];
    
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_word (id integer PRIMARY KEY, keyWord text NOT NULL, translation text,weight text, page text);"];
    if (!dbIsExists) {
        [[DataTool sharedDataTool] initDB];
    }
    
}


- (void)addWord:(WordModel *)word{
    
    NSString *path = [documentDirectoryPath() stringByAppendingPathComponent:@"words.sqlite"];
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:path];
    [queue inDatabase:^(FMDatabase *db) {
        
        [db executeUpdateWithFormat:@"INSERT INTO t_word(keyWord,translation,weight,page) VALUES (%@, %@,%@,%@);", word.keyWord, word.translation, word.weight,word.page];
    }];

}

- (NSArray *)queryWordsFromKeyWord:(NSString *)keyWord page:(NSString *)page{
    
    if ([keyWord isEqualToString:@""] ) {
        return nil;
    }
    NSString *sql = keyWord?[NSString stringWithFormat:@"SELECT keyWord,translation,weight,page FROM t_word WHERE keyWord LIKE '%%%@%%' OR  translation LIKE '%%%@%%' OR  weight LIKE '%%%@%%'  ORDER BY weight DESC  LIMIT 20;", keyWord, keyWord,keyWord]:@"SELECT * FROM t_word LIMIT 20;";
    
    FMResultSet *set = [_db executeQuery:sql];
    
    // 不断往下取数据
    NSMutableArray *words = [NSMutableArray array];
    while (set.next) {
        // 获得当前所指向的数据
        WordModel *word = [[WordModel alloc] init];
        word.keyWord = [set stringForColumn:@"keyWord"];
        word.translation = [set stringForColumn:@"translation"];
        word.weight = [set stringForColumn:@"weight"];
        word.page = [set stringForColumn:@"page"];
        
        [words addObject:word];
    }
    return words;
}


- (void)initDB{
    
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"txt"];
    NSString *string = [NSString stringWithContentsOfFile:dataPath encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *dataarr = [string componentsSeparatedByString:@"\n"];
    [dataarr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //这里面会自动生成 @autoreleasepool{} 如果用 for in 则需要手动创建
        
        NSArray *objecArr = [(NSString *)obj componentsSeparatedByString:@"\t"];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        if (objecArr.count) {
            [dic setValue:objecArr[0] forKey:@"keyWord"];
        }
        if (objecArr.count >= 2) {
            [dic setValue:objecArr[1] forKey:@"translation"];
        }
        if (objecArr.count >= 3) {
            [dic setValue:objecArr[2] forKey:@"weight"];
        }
        [dic setValue:[NSString stringWithFormat:@"%lu",idx/10] forKey:@"page"];
        WordModel *word = [[WordModel alloc] initWithDictionary:dic];
        [self addWord:word];
        
    }];
    
}



@end
