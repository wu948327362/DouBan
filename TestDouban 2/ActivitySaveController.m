//
//  ActivitySaveController.m
//  TestDouban
//
//  Created by lanou3g on 16/1/7.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "ActivitySaveController.h"
#import "ActivityDataBase.h"


@interface ActivitySaveController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *data;
@end

@implementation ActivitySaveController

- (void)loadView{
    [super loadView];
    self.sv = [[ActivitySaveView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.sv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sv.tableView.delegate = self;
    self.sv.tableView.dataSource = self;
    [self loadData];
}

- (void)loadData{
    self.data = [NSMutableArray array];
    
    //打开数据库
    [[MyDataBaseTools sharedInstance] openDb];
    //得到数据
    self.data = [[MyDataBaseTools sharedInstance] queryFromDb];
    //关闭数据库
    [[MyDataBaseTools sharedInstance] closeDbdb];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:25];
    ActivityModel *model = self.data[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
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
