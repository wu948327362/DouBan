//
//  RegisterView.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

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
    
    self.userLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 84, 80, 30)];
    self.userLabel.font = [UIFont systemFontOfSize:20];
    self.userLabel.text = @"用户名";
    [self addSubview:self.userLabel];
    
    self.pwdLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 124, 80, 30)];
    self.pwdLabel.font = [UIFont systemFontOfSize:20];
    self.pwdLabel.text = @"密码";
    [self addSubview:self.pwdLabel];
    
    self.confirmPwdLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 164, 80, 30)];
    self.confirmPwdLabel.font = [UIFont systemFontOfSize:20];
    self.confirmPwdLabel.text = @"确认密码";
    [self addSubview:self.confirmPwdLabel];
    
    self.emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 204, 80, 30)];
    self.emailLabel.font = [UIFont systemFontOfSize:20];
    self.emailLabel.text = @"邮箱";
    [self addSubview:self.emailLabel];
    
    self.contactLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 244, 80, 30)];
    self.contactLabel.font = [UIFont systemFontOfSize:20];
    self.contactLabel.text = @"联系方式";
    [self addSubview:self.contactLabel];
    
    self.userField = [[UITextField alloc] initWithFrame:CGRectMake(150, 84, 300, 30)];
    self.userField.placeholder = @"请输入用户名";
    [self addSubview:self.userField];
    
    self.pwdField = [[UITextField alloc] initWithFrame:CGRectMake(150, 124, 300, 30)];
    self.pwdField.placeholder = @"请输入用密码";
    [self addSubview:self.pwdField];

    self.confirmPwdField = [[UITextField alloc] initWithFrame:CGRectMake(150, 164, 300, 30)];
    self.confirmPwdField.placeholder = @"请再次确认密码";
    [self addSubview:self.confirmPwdField];
    
    self.emailField = [[UITextField alloc] initWithFrame:CGRectMake(150, 204, 300, 30)];
    self.emailField.placeholder = @"请输入邮箱";
    [self addSubview:self.emailField];
    
    self.contactField = [[UITextField alloc] initWithFrame:CGRectMake(150, 244, 300, 30)];
    self.contactField.placeholder = @"请输入联系方式";
    [self addSubview:self.contactField];
    
    self.confirmBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.confirmBtn.frame = CGRectMake(30, 300, 60, 40);
    [self.confirmBtn setTitle:@"confirm" forState:UIControlStateNormal];
    [self addSubview:self.confirmBtn];
    
    self.reset = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.reset.frame = CGRectMake(120, 300, 60, 40);
    [self.reset setTitle:@"reset" forState:UIControlStateNormal];
    [self addSubview:self.reset];
    
}

@end























