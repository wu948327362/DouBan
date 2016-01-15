//
//  Users.h
//  TestDouban
//
//  Created by lanou3g on 16/1/11.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject
@property(nonatomic,assign)NSInteger uid;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *password;
@property(nonatomic,copy)NSString *email;
@property(nonatomic,copy)NSString *contact;
@property(nonatomic,assign)NSInteger isLogin;
@end
