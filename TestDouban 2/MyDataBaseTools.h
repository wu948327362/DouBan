//
//  MyDataBaseTools.h
//  UILesson19_dataBase
//
//  Created by lanou3g on 15/12/31.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "FMDatabase.h"
#import "ActivityModel.h"


@interface MyDataBaseTools : NSObject

@property(nonatomic,strong)FMDatabase *database;
//把他做成单例
+ (instancetype)sharedInstance;

//打开关闭数据库
- (void)openDb;
- (void)closeDbdb;

- (NSMutableArray *)queryFromDb;
- (ActivityModel *)queryFromDbByid:(NSInteger)aid;

- (void)addModel:(ActivityModel *)activity;

- (void)clearAll;
@end


















