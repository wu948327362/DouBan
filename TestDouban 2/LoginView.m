//
//  LoginView.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setView];
    }
    return self;
}

- (void)setView{
    self.backgroundColor = [UIColor whiteColor];
    
    self.userLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 84, 80, 50)];
    self.userLabel.font = [UIFont systemFontOfSize:20];
    self.userLabel.text = @"用户名";
    [self addSubview:self.userLabel];
    
    self.pwdLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 154, 80, 50)];
    self.pwdLabel.font = [UIFont systemFontOfSize:20];
    //self.pwdLabel.backgroundColor = [UIColor blueColor];
    self.pwdLabel.text = @"密码";
    [self addSubview:self.pwdLabel];
    
    self.userField = [[UITextField alloc] initWithFrame:CGRectMake(150, 84, 300, 50)];
    self.userField.placeholder = @"请输入用户名";
    
    [self addSubview:self.userField];
    
    self.pwdField = [[UITextField alloc] initWithFrame:CGRectMake(150, 154, 300, 50)];
    self.pwdField.placeholder = @"请输入密码";
    //self.pwdField.backgroundColor = [UIColor blueColor];
    [self addSubview:self.pwdField];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.loginBtn.frame = CGRectMake(20, 240, 150, 60);
    [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = 10;
    self.loginBtn.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.loginBtn];
    
    self.registBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.registBtn.frame = CGRectMake(190, 240, 150, 60);
    self.registBtn.layer.masksToBounds = YES;
    self.registBtn.layer.cornerRadius = 10;
    [self.registBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.registBtn.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.registBtn];
    
}

@end
















