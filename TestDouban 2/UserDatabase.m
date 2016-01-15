//
//  UserDatabase.m
//  TestDouban
//
//  Created by lanou3g on 16/1/11.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "UserDatabase.h"
#import <sqlite3.h>

static UserDatabase *handler;
@implementation UserDatabase
+ (instancetype)sharedInstance{
    if (handler==nil) {
        handler = [[UserDatabase alloc] init];
    }
    return handler;
}
static sqlite3 *userDb;
- (void)createTable{
    NSString *sql = @"CREATE TABLE IF NOT EXISTS users (uid INTEGER PRIMARY KEY NOT NULL UNIQUE , userName TEXT, password TEXT, email TEXT, contact TEXT, isLogin INTEGER)";
    
    [self execDb:sql];
}
- (void)openDb{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [path stringByAppendingString:@"/User.sqlite"];
    NSLog(@"%@",filePath);
    int result = sqlite3_open(filePath.UTF8String, &userDb);
    
    if (result==SQLITE_OK) {
        NSLog(@"open ok");
    }else{
        NSLog(@"open error %d",result);
    }
}
- (void)closeDb{
    int result = sqlite3_close(userDb);
    if (result==SQLITE_OK) {
        NSLog(@"close ok");
    }else{
        NSLog(@"close error %d",result);
    }
}
- (void)insertDb:(Users *)user{
    NSString *sql1 = [NSString stringWithFormat:@"INSERT INTO users (userName,password,email,isLogin) VALUES ('%@','%@','%@',%d)",user.userName,user.password,user.contact,0];
    
    [self execDb:sql1];
}
- (NSMutableArray *)findAll{
    NSMutableArray *arr = [NSMutableArray array];
    
    sqlite3_stmt *stmt = NULL;
    NSString *sql = @"select * from users";
    
    int result = sqlite3_prepare(userDb, sql.UTF8String, -1, &stmt, NULL);
    if (result==SQLITE_OK) {
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            Users *user = [[Users alloc] init];
            
            user.userName = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            user.password = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            user.email = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            user.isLogin = sqlite3_column_int(stmt, 5);
            //NSLog(@"%d",sqlite3_column_int(stmt, 5));
            [arr addObject:user];
        }
    }else{
        NSLog(@"error %d",result);
    }
    sqlite3_finalize(stmt);
    
    return arr;
}
- (BOOL)findByUserName:(NSString *)userName pwd:(NSString *)pwd{
    NSMutableArray *arr = [self findAll];
    
    for (Users *u in arr) {
        if ([u.userName isEqualToString:userName]&&[u.password isEqualToString:pwd]) {
            return YES;
        }
        NSLog(@"%@===%@=====%@======%@",userName,pwd,u.userName,u.password);
    }
    
    return NO;
}

- (BOOL)isLogin{
    [self openDb];
    NSMutableArray *arr = [self findAll];
    
    for (Users *u in arr) {
        if (u.isLogin) {
            return YES;
        }
    }
    return NO;
}

- (void)LoginOut{
    NSString *sql = [NSString stringWithFormat:@"update users set isLogin=%d",0];
    [self execDb:sql];
}

- (void)updateLoginState:(NSString *)userName loginSate:(NSInteger)state{
    NSString *sql = [NSString stringWithFormat:@"update users set isLogin=%ld where userName='%@'",state,userName];
    [self execDb:sql];
}

- (void)execDb:(NSString *)sql{
    int result = sqlite3_exec(userDb, sql.UTF8String, NULL, NULL, NULL);
    if (result==SQLITE_OK) {
        NSLog(@"操作数据库成功");
    }else{
        NSLog(@"操作数据库失败:%d",result);
    }
}
@end









