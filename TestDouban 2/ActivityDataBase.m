//
//  ActivityDataBase.m
//  TestDouban
//
//  Created by lanou3g on 16/1/6.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "ActivityDataBase.h"

static ActivityDataBase *handler;
@implementation ActivityDataBase
+ (instancetype)sharedInstace{
    if (handler==nil) {
        handler = [[ActivityDataBase alloc] init];
    }
    return handler;
}
static sqlite3 *activityDB;

- (void)openDataBase{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [path stringByAppendingString:@"/activity.sqlite"];
    NSLog(@"%@",filePath);
    int result = sqlite3_open(filePath.UTF8String, &activityDB);
    
    if (result==SQLITE_OK) {
        NSLog(@"open ok");
    }else{
        NSLog(@"open error %d",result);
    }
    
    
}
- (void)closeDataBase{
    int result = sqlite3_close(activityDB);
    if (result==SQLITE_OK) {
        NSLog(@"close ok");
    }else{
        NSLog(@"close error %d",result);
    }
}
- (void)createTable{
    NSString *sql = @"CREATE TABLE IF NOT EXISTS ActivityInfo (aid INTEGER PRIMARY KEY NOT NULL UNIQUE , title TEXT, begin_time TEXT, end_time TEXT, address TEXT, category_nam TEXT, participant_count TEXT, wisher_count TEXT, image TEXT, name TEXT NOT NULL , content TEXT)";

    [self execDb:sql];
}
- (void)addActivity:(ActivityModel *)activity{
    
    NSLog(@"(%ld,'%@','%@','%@','%@','%@','%@','%@','%@','%@')",activity.aid,activity.title,activity.begin_time,activity.end_time,activity.address,activity.category_name,activity.participant_count,activity.wisher_count,activity.image,activity.name);
    
    NSString *sql1 = [NSString stringWithFormat:@"INSERT INTO ActivityInfo (aid,title,begin_time,end_time,address,category_nam,participant_count,wisher_count,image,name,content) VALUES (%ld,'%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')",activity.aid,activity.title,activity.begin_time,activity.end_time,activity.address,activity.category_name,activity.participant_count,activity.wisher_count,activity.image,activity.name,activity.content];
    
    [self execDb:sql1];
}
- (void)delActivity:(NSInteger)aid{
    NSString *sql = [NSString stringWithFormat:@"delete from ActivityInfo where aid = %ld",aid];
    
    [self execDb:sql];
    
}

- (void)execDb:(NSString *)sql{
    int result = sqlite3_exec(activityDB, sql.UTF8String, NULL, NULL, NULL);
    if (result==SQLITE_OK) {
        NSLog(@"操作数据库成功");
    }else{
        NSLog(@"操作数据库失败:%d",result);
    }
}

- (NSMutableArray<ActivityModel *> *)selectAllActivity{
    NSMutableArray *data = [NSMutableArray array];
    sqlite3_stmt *stmt = NULL;
    NSString *sql = @"select * from ActivityInfo";
    
    int result = sqlite3_prepare(activityDB, sql.UTF8String, -1, &stmt, NULL);
    if (result==SQLITE_OK) {
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            ActivityModel *model = [[ActivityModel alloc] init];
            
            model.aid = sqlite3_column_int(stmt, 0);
            model.title = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            model.begin_time = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            model.end_time = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            model.address = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
            model.category_name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            model.participant_count = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
            model.wisher_count = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
            model.image = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 8)];
            model.name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 9)];
            model.content = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 10)];
            [data addObject:model];
        }
    }
    sqlite3_finalize(stmt);
    return data;
}
- (ActivityModel *)findActivityByaid:(NSInteger)aid{
    ActivityModel *model = [[ActivityModel alloc] init];
    
    NSMutableArray *arr = [self selectAllActivity];
    
    for (ActivityModel *m in arr) {
        if (aid==m.aid) {
            model = m;
        }
    }
    
    return model;
}


@end















