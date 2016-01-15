//
//  RegisterViewController.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "RegisterViewController.h"
#import "UserDatabase.h"
#import "LoginViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)loadView{
    [super loadView];
    self.rev = [[RegisterView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.rev;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.rev.confirmBtn addTarget:self action:@selector(confirmBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)confirmBtnAction:(UIButton *)sender{
    [[UserDatabase sharedInstance] openDb];
    [[UserDatabase sharedInstance] createTable];
    Users *u = [[Users alloc] init];
    u.userName = self.rev.userField.text;
    u.password = self.rev.pwdField.text;
    u.email = self.rev.emailField.text;
    u.contact = self.rev.contactField.text;
    [[UserDatabase sharedInstance] insertDb:u];
    [[UserDatabase sharedInstance] closeDb];
    
    LoginViewController *lvc = [[LoginViewController alloc] init];
    [self presentViewController:lvc animated:YES completion:nil];
    
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
