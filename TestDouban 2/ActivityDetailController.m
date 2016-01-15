//
//  ActivityDetailController.m
//  TestDouban
//
//  Created by lanou3g on 16/1/4.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "ActivityDetailController.h"
#import "MyNetTools.h"
#import "LoginViewController.h"
#import "ActivityDataBase.h"
#import "MyDataBaseTools.h"
#import "UserDatabase.h"

#define URLAC @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php"


@interface ActivityDetailController ()


@end

@implementation ActivityDetailController

//static sqlite3 *db = nil;

- (void)loadView{
    [super loadView];
    self.av = [[AcDetailView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.av;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(saveAction)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftAction)];
    self.av.am = self.a;
    self.isLogin = NO;
    [self loadData];
    
    //NSLog(@"%ld",self.a.aid);
    
}

- (void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
    self.login(self.isLogin);
}

- (void)saveAction{
    
    if ([[UserDatabase sharedInstance] isLogin]==0) {
        LoginViewController *login = [[LoginViewController alloc] init];
        login.login = ^(BOOL login){
            self.isLogin = login;
        };
        [self.navigationController pushViewController:login animated:YES];
    }else{
        //查询是否已收藏该活动.
        ActivityModel *m = [[MyDataBaseTools sharedInstance] queryFromDbByid:self.a.aid];
        
        NSLog(@"%@=====%@",m.name,m.begin_time);
        //根据活动是否存在进行操作
        if (m!=nil) {
            //已经收藏该活动
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Error" message:@"已经收藏" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *aa = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [ac addAction:aa];
            [self presentViewController:ac animated:YES completion:nil];
            
        }else{
            [[MyDataBaseTools sharedInstance] addModel:self.a];
        }
    }
    
}

- (void)loadData{
    [MyNetTools solveDataWithUrl:self.av.am.image httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
        
        self.av.photoView.image = [UIImage imageWithData:data];
    }];
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
