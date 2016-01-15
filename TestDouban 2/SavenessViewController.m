//
//  SavenessViewController.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "SavenessViewController.h"
#import "ActivitySaveController.h"
#import "MyDataBaseTools.h"

@interface SavenessViewController ()

@end

@implementation SavenessViewController

- (void)loadView{
    [super loadView];
    self.sv = [[SavenessView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.sv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.sv.myActivity addTarget:self action:@selector(activityAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.sv.clearCache addTarget:self action:@selector(clearAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clearAction:(UIButton *)sender{
    [[MyDataBaseTools sharedInstance] clearAll];
}

- (void)activityAction:(UIButton *)sender{
    ActivitySaveController *asc = [[ActivitySaveController alloc] init];
    [self.navigationController pushViewController:asc animated:YES];
    
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
