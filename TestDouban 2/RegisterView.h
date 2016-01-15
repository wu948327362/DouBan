//
//  RegisterView.h
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView
@property(nonatomic,strong)UILabel *userLabel;
@property(nonatomic,strong)UILabel *pwdLabel;
@property(nonatomic,strong)UILabel *confirmPwdLabel;
@property(nonatomic,strong)UILabel *emailLabel;
@property(nonatomic,strong)UILabel *contactLabel;
@property(nonatomic,strong)UITextField *userField;
@property(nonatomic,strong)UITextField *pwdField;
@property(nonatomic,strong)UITextField *confirmPwdField;
@property(nonatomic,strong)UITextField *emailField;
@property(nonatomic,strong)UITextField *contactField;
@property(nonatomic,strong)UIButton *confirmBtn;
@property(nonatomic,strong)UIButton *reset;
@end
