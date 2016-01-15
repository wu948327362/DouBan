//
//  MovieDetail.m
//  TestDouban
//
//  Created by lanou3g on 16/1/3.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "MovieDetail.h"

@implementation MovieDetail

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setView];
    }
    return self;
}

- (void)setMdm:(MovieDetailModel *)mdm{
    _mdm = mdm;
    self.ratingLabel.text = [NSString stringWithFormat:@"评分:%@",mdm.rating];
    self.releaseLabel.text = mdm.release_date;
    self.runntimeLabel.text = mdm.runtime;
    self.genresLabel.text = mdm.genres;
    self.countryLabel.text = mdm.country;
    self.actorsLabel.text = mdm.actors;
    self.plotLabel.text = mdm.plot_simple;
    
    self.photoView.image = mdm.image;
    
    CGSize size = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)-40,1000);
    NSDictionary *dic =@{NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
    CGRect rect = [mdm.plot_simple boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    CGRect frame = self.plotLabel.frame;
    
    frame.size = rect.size;
    self.plotLabel.frame = frame;
    
//    self.tableView.contentSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds),self.photoView.frame.size.height+self.actTitleLabel.frame.size.height+self.actorsLabel.frame.size.height+self.plotTitleLabel.frame.size.height+self.plotLabel.frame.size.height);
    
    //self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds),CGRectGetMaxY(self.plotLabel.frame));
    self.tableView.contentSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetMaxY(self.plotLabel.frame)+10);
    
}

- (void)setView{
    self.backgroundColor = [UIColor blueColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) style:UITableViewStyleGrouped];
    self.tableView.bounces = NO;
    self.tableView.pagingEnabled = NO;
    self.tableView.scrollEnabled = YES;
    self.tableView.showsVerticalScrollIndicator = YES;
    self.tableView.contentSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 2*CGRectGetHeight([UIScreen mainScreen].bounds));
    [self addSubview:self.tableView];
    
    self.photoView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 150, 200)];
    self.photoView.backgroundColor = [UIColor cyanColor];
    [self.tableView addSubview:self.photoView];
    
    self.ratingLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 25, 200, 30)];
    self.ratingLabel.text = @"评分";
    //self.ratingLabel.backgroundColor = [UIColor cyanColor];
    [self.tableView addSubview:self.ratingLabel];
    
    self.releaseLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 65, 200, 30)];
    self.releaseLabel.text = @"评分";
    //self.releaseLabel.backgroundColor = [UIColor cyanColor];
    [self.tableView addSubview:self.releaseLabel];
    
    self.runntimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 105, 200, 30)];
    self.runntimeLabel.text = @"评分";
    //self.runntimeLabel.backgroundColor = [UIColor cyanColor];
    [self.tableView addSubview:self.runntimeLabel];
    
    self.genresLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 145, 200, 30)];
    self.genresLabel.text = @"评分";
    //self.genresLabel.backgroundColor = [UIColor cyanColor];
    [self.tableView addSubview:self.genresLabel];
    
    self.countryLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 185, 200, 30)];
    self.countryLabel.text = @"评分";
    //self.countryLabel.backgroundColor = [UIColor cyanColor];
    [self.tableView addSubview:self.countryLabel];
    
    self.actTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 234, 150, 50)];
    self.actTitleLabel.font = [UIFont systemFontOfSize:20];
    self.actTitleLabel.text = @"制作人";
    [self.tableView addSubview:self.actTitleLabel];
    
    self.actorsLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 301, CGRectGetWidth([UIScreen mainScreen].bounds)-40, 100)];
    self.actorsLabel.numberOfLines = 0;
    [self.tableView addSubview:self.actorsLabel];
    
    self.plotTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 435, 150, 50)];
    self.plotTitleLabel.font = [UIFont systemFontOfSize:20];
    self.plotTitleLabel.text = @"电影情节";
    [self.tableView addSubview:self.plotTitleLabel];
    
    self.plotLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 500, CGRectGetWidth([UIScreen mainScreen].bounds)-40, 500)];
    self.plotLabel.font = [UIFont systemFontOfSize:16];
    self.plotLabel.numberOfLines = 0;
    [self.tableView addSubview:self.plotLabel];
    
}

@end


















