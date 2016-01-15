//
//  ActivityDetailController.h
//  TestDouban
//
//  Created by lanou3g on 16/1/4.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AcDetailView.h"
#import "MyDataBaseTools.h"

typedef void(^LoginBlc)(BOOL login);

@interface ActivityDetailController : UIViewController
@property(nonatomic,strong)AcDetailView *av;
@property(nonatomic,strong)ActivityModel *a;
@property(nonatomic,copy)LoginBlc login;
@property(nonatomic,assign)BOOL isLogin;
@end
