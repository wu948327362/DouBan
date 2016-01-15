//
//  ActivityDataBase.h
//  TestDouban
//
//  Created by lanou3g on 16/1/6.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActivityModel.h"
#import <sqlite3.h>

@interface ActivityDataBase : NSObject

+ (instancetype)sharedInstace;

- (void)openDataBase;
- (void)closeDataBase;
- (void)createTable;
- (void)addActivity:(ActivityModel *)activity;
- (void)delActivity:(NSInteger)aid;
- (NSMutableArray<ActivityModel *> *)selectAllActivity;
- (ActivityModel *)findActivityByaid:(NSInteger)aid;
@end
