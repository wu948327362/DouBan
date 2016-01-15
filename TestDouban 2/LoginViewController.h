//
//  LoginViewController.h
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"

typedef void(^LoginBlock)(BOOL login);

@interface LoginViewController : UIViewController
@property(nonatomic,strong)LoginView *lv;
@property(nonatomic,copy)LoginBlock login;
@end
