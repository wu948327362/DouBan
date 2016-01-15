//
//  MovieViewController.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "MovieViewController.h"
#import "MoviewCell.h"
#import "MovieDetailController.h"

#define MOVIEURL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/movielist.php"

@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MovieViewController

- (void)loadView{
    [super loadView];
    self.mv = [[MovieView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.mv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mv.tableView.delegate = self;
    self.mv.tableView.dataSource = self;
    self.navigationItem.title = @"电影";
    [self makeData];
    
}

- (void)makeData{
    self.data = [NSMutableArray array];
    [MyNetTools solveDataWithUrl:MOVIEURL httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        for (NSDictionary *d in dic[@"result"]) {
            MovieModel *m = [[MovieModel alloc] init];
            [m setValuesForKeysWithDictionary:d];
            [self.data addObject:m];
        }
        [self.mv.tableView reloadData];
        
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSLog(@"%ld",self.data.count);
    return self.data.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieDetailController *mdc = [[MovieDetailController alloc] init];
    mdc.movieid = [self.data[indexPath.row] movieId];
    [self.navigationController pushViewController:mdc animated:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MoviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[MoviewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    MovieModel *m = self.data[indexPath.row];
    cell.titleLabel.text = m.movieName;
    if ((m.isLoading==NO)&&m.image==nil) {
        [m loadImage];
        [m addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:(__bridge void * _Nullable)(indexPath)];
    }else{
        cell.photoView.image = m.image;
    }
    
    return cell;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    UIImage *image = change[NSKeyValueChangeNewKey];
    if (image==nil) {
        return;
    }
    NSIndexPath *path = (__bridge NSIndexPath *)(context);
    NSArray *arr = [self.mv.tableView indexPathsForVisibleRows];
    
    if ([arr containsObject:path]) {
        MoviewCell *cell = [self.mv.tableView cellForRowAtIndexPath:path];
        cell.photoView.image = image;
        
        [self.mv.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
    }
    
    [object removeObserver:self forKeyPath:@"image"];
    
    
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
