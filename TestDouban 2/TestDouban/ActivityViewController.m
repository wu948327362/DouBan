//
//  ActivityViewController.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityCell.h"
#import "ActivityModel.h"
#import "MyNetTools.h"
#import "ActivityDetailController.h"
#import "ActivityDataBase.h"
#import "MyDataBaseTools.h"
#import "UserDatabase.h"

#define ACTIVITYURL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php"


@interface ActivityViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,assign)BOOL isLogin;
@end

static BOOL login;
@implementation ActivityViewController

- (void)loadView{
    [super loadView];
    self.av = [[ActivityView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.av;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.av.tableView.delegate = self;
    self.av.tableView.dataSource = self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:@selector(rightAction)];
    
    [self loadData];
    [[UserDatabase sharedInstance] openDb];
    
}

- (void)rightAction{
    [[UserDatabase sharedInstance] LoginOut];
}

- (void)loadData{
    self.data = [NSMutableArray array];
    
    [MyNetTools solveDataWithUrl:ACTIVITYURL httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        for (NSDictionary *d in dic[@"events"]) {
            ActivityModel *am = [[ActivityModel alloc] init];
            [am setValuesForKeysWithDictionary:d];
            am.name = d[@"owner"][@"name"];
            [self.data addObject:am];
        }
        [self.av.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityDetailController *adc = [[ActivityDetailController alloc] init];
    adc.a = self.data[indexPath.row];
    adc.login = ^(BOOL login){
        login = login;
    };
    adc.isLogin = login;
    //第一次进入该页面创建数据库表
    [[MyDataBaseTools sharedInstance] openDb];
    [self.navigationController pushViewController:adc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[ActivityCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.am = self.data[indexPath.row];
    
    if ((cell.am.isLoading==NO)&&cell.am.im==nil) {
        cell.photoView.image = [UIImage imageNamed:@"3.jpeg"];
        [cell.am loadImage];
        [cell.am addObserver:self forKeyPath:@"im" options:NSKeyValueObservingOptionNew context:(__bridge void * _Nullable)(indexPath)];
        
    }else{
        cell.photoView.image = cell.am.im;
    }
    
    
    return cell;
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    UIImage *i = change[NSKeyValueChangeNewKey];
    //NSLog(@"+++++++++++");
    if (i==nil) {
        //NSLog(@"+++++++++++");
        return;
    }
    
    NSIndexPath *path = (__bridge NSIndexPath *)(context);
    
    NSArray *arr = [self.av.tableView indexPathsForVisibleRows];
    
    if ([arr containsObject:path]) {
        ActivityCell *cell = [self.av.tableView cellForRowAtIndexPath:path];
        cell.photoView.image = i;
        [self.av.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
    }
    [object removeObserver:self forKeyPath:@"im"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
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










