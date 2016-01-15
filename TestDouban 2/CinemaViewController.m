//
//  CinemaViewController.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaCell.h"
#import "MyNetTools.h"

#define CINEMAURL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/cinemalist.php"

@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *data;
@end

@implementation CinemaViewController

- (void)loadView{
    [super loadView];
    self.cv = [[CinemaView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.cv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.cv.tableView.delegate = self;
    self.cv.tableView.dataSource = self;
    
    [self loadData];
    
}

- (void)loadData{
    self.data = [NSMutableArray array];
    
    [MyNetTools solveDataWithUrl:CINEMAURL httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        for (NSDictionary *d in dic[@"result"][@"data"]) {
            CinemaModel *cm = [[CinemaModel alloc] init];
            
            [cm setValuesForKeysWithDictionary:d];
            
            [self.data addObject:cm];
        }
        [self.cv.tableView reloadData];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[CinemaCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.model = self.data[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
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
