//
//  LoginViewController.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "UserDatabase.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)loadView{
    [super loadView];
    self.lv = [[LoginView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.lv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.lv.registBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.lv.loginBtn addTarget:self action:@selector(loginActino:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loginActino:(UIButton *)sender{
    if ([[UserDatabase sharedInstance] findByUserName:self.lv.userField.text pwd:self.lv.pwdField.text]) {
        [self.navigationController popViewControllerAnimated:YES];
        [[UserDatabase sharedInstance] updateLoginState:self.lv.userField.text loginSate:1];
        self.login(YES);
        
    }else{
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Error" message:@"用户名密码错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *aa = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [ac addAction:aa];
        [self presentViewController:ac animated:YES completion:nil];
    }
}

- (void)registerAction:(UIButton *)sender{
    RegisterViewController *rvc = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:rvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
