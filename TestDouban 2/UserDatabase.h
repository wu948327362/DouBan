//
//  UserDatabase.h
//  TestDouban
//
//  Created by lanou3g on 16/1/11.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Users.h"

@interface UserDatabase : NSObject
+ (instancetype)sharedInstance;
- (void)createTable;
- (void)openDb;
- (void)closeDb;
- (void)insertDb:(Users *)user;
- (NSMutableArray *)findAll;
- (BOOL)findByUserName:(NSString *)userName pwd:(NSString *)pwd;
- (BOOL)isLogin;
- (void)updateLoginState:(NSString *)userName loginSate:(NSInteger)state;
- (void)LoginOut;
@end
