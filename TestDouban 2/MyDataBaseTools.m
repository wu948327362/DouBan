//
//  MyDataBaseTools.m
//  UILesson19_dataBase
//
//  Created by lanou3g on 15/12/31.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "MyDataBaseTools.h"



//声明一个静态的自身对象
static MyDataBaseTools *handler;
static BOOL iscreate;
@implementation MyDataBaseTools

+ (instancetype)sharedInstance{
    if (handler==nil) {
        handler = [[self alloc] init];
    }
    return handler;
}

#pragma mark====使用需要创建一个静态的数据库对象.
//是一个数据操作对象,我们所有的操作都是通过他对文件进行操作的.
//static sqlite3 *db = nil;

//打开关闭数据库
- (void)openDb{
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *path = [docPath stringByAppendingString:@"/myfmdb.db"];
    self.database = [FMDatabase databaseWithPath:path];
    
    [self.database open];
    if (!iscreate) {
        NSString *sql = @"CREATE TABLE IF NOT EXISTS ActivityInfo (aid INTEGER PRIMARY KEY NOT NULL UNIQUE , title TEXT, begin_time TEXT, end_time TEXT, address TEXT, category_nam TEXT, participant_count TEXT, wisher_count TEXT, image TEXT, name TEXT NOT NULL , content TEXT)";
        [self execDb:sql];
        iscreate = YES;
    }else{
        NSLog(@"already created");
    }
}
- (void)execDb:(NSString *)sql{
    @synchronized(self) {
        BOOL result = [self.database executeUpdate:sql];
        
        if (!result) {
            NSLog(@"operate database error");
        }else{
            NSLog(@"operate database ok");
        }
    }
}

- (ActivityModel *)queryFromDbByid:(NSInteger)aid{
    NSMutableArray *arr = [self queryFromDb];
    
    for (ActivityModel *m in arr) {
        if (m.aid==aid) {
            return m;
        }
    }
    return nil;
}

- (void)closeDbdb{
    [self.database close];
}

- (NSMutableArray *)queryFromDb{
    NSString *sql = @"select * from ActivityInfo";
    FMResultSet *set = [self.database executeQuery:sql];
    NSMutableArray *arr = [NSMutableArray array];
    while (set.next) {
        ActivityModel *model = [[ActivityModel alloc] init];
        
        model.aid = [set intForColumnIndex:0];
        model.title = [set stringForColumnIndex:1];
        model.begin_time = [set stringForColumnIndex:2];
        model.end_time = [set stringForColumnIndex:3];
        model.address= [set stringForColumnIndex:4];
        model.category_name= [set stringForColumnIndex:5];
        model.participant_count= [set stringForColumnIndex:6];
        model.wisher_count= [set stringForColumnIndex:7];
        model.image= [set stringForColumnIndex:8];
        model.name= [set stringForColumnIndex:9];
        model.content= [set stringForColumnIndex:10];
        
        [arr addObject:model];
    }
    
    return arr;
}

- (void)addModel:(ActivityModel *)activity{
    [self.database executeUpdate:@"INSERT INTO ActivityInfo (aid,title,begin_time,end_time,address,category_nam,participant_count,wisher_count,image,name,content) VALUES (?,?,?,?,?,?,?,?,?,?,?)",[NSNumber numberWithInteger:activity.aid],activity.title,activity.begin_time,activity.end_time,activity.address,activity.category_name,activity.participant_count,activity.wisher_count,activity.image,activity.name,activity.content];
}


- (void)clearAll{
    [self.database open];
    NSString *sql = @"delete from ActivityInfo";
    [self.database executeUpdate:sql];
    [self.database close];
    
}

@end



























