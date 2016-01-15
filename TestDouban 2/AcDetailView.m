//
//  AcDetailView.m
//  TestDouban
//
//  Created by lanou3g on 16/1/4.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "AcDetailView.h"

@implementation AcDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setView];
    }
    return self;
}

- (void)setView{
    self.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.pagingEnabled = NO;
    self.scrollView.bounces = NO;
//    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 2*CGRectGetHeight([UIScreen mainScreen].bounds));
    [self addSubview:self.scrollView];
    
    self.photoView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 150, 200)];
    self.photoView.backgroundColor = [UIColor cyanColor];
    [self.scrollView addSubview:self.photoView];
    
    self.timeView = [[ActivityCellView alloc] initWithFrame:CGRectMake(165, 50, 200, 30)];
    self.timeView.vi.image = [UIImage imageNamed:@"icon_date@2x.png"];
    self.timeView.la.text = @"评分";
    //self.ratingLabel.backgroundColor = [UIColor cyanColor];
    [self.scrollView addSubview:self.timeView];
    
    self.nameView = [[ActivityCellView alloc] initWithFrame:CGRectMake(165, 90, 200, 30)];
    self.nameView.la.text = @"评分";
    self.nameView.vi.image = [UIImage imageNamed:@"icon_sponsor_blue@2x.png"];
    //self.releaseLabel.backgroundColor = [UIColor cyanColor];
    [self.scrollView addSubview:self.nameView];
    
    self.typeView = [[ActivityCellView alloc] initWithFrame:CGRectMake(165, 130, 200, 30)];
    self.typeView.la.text = @"评分";
    self.typeView.vi.image = [UIImage imageNamed:@"icon_catalog@2x.png"];
    //self.runntimeLabel.backgroundColor = [UIColor cyanColor];
    [self.scrollView addSubview:self.typeView];
    
    self.addressView = [[ActivityCellView alloc] initWithFrame:CGRectMake(165, 170, 200, 30)];
    self.addressView.la.text = @"评分";
    self.addressView.la.numberOfLines = 0;
    self.addressView.la.font = [UIFont systemFontOfSize:16];
    self.addressView.vi.image = [UIImage imageNamed:@"icon_spot@2x.png"];
    //self.genresLabel.backgroundColor = [UIColor cyanColor];
    [self.scrollView addSubview:self.addressView];
    
    self.acTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 320, 200, 50)];
    self.acTitle.font = [UIFont systemFontOfSize:25];
    self.acTitle.text = @"活动介绍";
    [self.scrollView addSubview:self.acTitle];
    
    self.acContent = [[UILabel alloc] initWithFrame:CGRectMake(20, 380, CGRectGetWidth([UIScreen mainScreen].bounds)-40, 100)];
    self.acContent.font = [UIFont systemFontOfSize:16];
    self.acContent.numberOfLines = 0;
    [self.scrollView addSubview:self.acContent];
    
}

- (void)setAm:(ActivityModel *)am{
    _am = am;
    
    self.timeView.la.text = am.begin_time;
    self.nameView.la.text = am.name;
    self.addressView.la.text = am.address;
    self.typeView.la.text = am.category_name;
    self.acContent.text = [NSString stringWithFormat:@"%@",am.content];

    
    CGSize size = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)-40,1000);
    NSDictionary *dic =@{NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
    CGRect rect = [am.content boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    CGRect frame = self.acContent.frame;
    
    frame.size = rect.size;
    self.acContent.frame = frame;
    
    CGSize size1 = CGSizeMake(180,1000);
    NSDictionary *dic1 =@{NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
    CGRect rect1 = [am.address boundingRectWithSize:size1 options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dic1 context:nil];
    
    CGRect frame1 = self.addressView.la.frame;
    
    frame1.size = rect1.size;
    self.addressView.la.frame = frame1;
    
    //self.scrollView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds),CGRectGetMaxY(self.acContent.frame));
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetMaxY(self.acContent.frame)+10);
    
    
}

@end




















