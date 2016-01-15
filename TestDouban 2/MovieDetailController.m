//
//  MovieDetailController.m
//  TestDouban
//
//  Created by lanou3g on 16/1/3.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "MovieDetailController.h"
#import "MyNetTools.h"
#define MOVIEURL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php"


@interface MovieDetailController ()
@property(nonatomic,strong)MovieDetailModel *mdm;
@end

@implementation MovieDetailController

- (void)loadView{
    [super loadView];
    self.md = [[MovieDetail alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.md;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    NSString *url = [NSString stringWithFormat:@"%@?movieId=%@",MOVIEURL,self.movieid];
    
    self.mdm = [[MovieDetailModel alloc] init];
    [MyNetTools solveDataWithUrl:url httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *d = dic[@"result"];
        
        
        [self.mdm setValuesForKeysWithDictionary:d];
        
        self.md.mdm = self.mdm;

        [MyNetTools solveDataWithUrl:self.mdm.poster httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
            self.md.photoView.image = [UIImage imageWithData:data];
        }];
        
        //[self.md.tableView reloadData];
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
