//
//  SavenessView.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "SavenessView.h"

@implementation SavenessView

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
    
    self.myActivity = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.myActivity.frame = CGRectMake(0, 74, CGRectGetWidth([UIScreen mainScreen].bounds), 60);
    self.myActivity.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.myActivity setTitle:@"我的活动" forState:UIControlStateNormal];
    [self addSubview:self.myActivity];
    
    self.myMovie = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.myMovie.frame = CGRectMake(0, 140, CGRectGetWidth([UIScreen mainScreen].bounds), 60);
    self.myMovie.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.myMovie setTitle:@"我的电影" forState:UIControlStateNormal];
    [self addSubview:self.myMovie];
    
    
    self.clearCache = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.clearCache.frame = CGRectMake(0, 210, CGRectGetWidth([UIScreen mainScreen].bounds), 60);
    self.clearCache.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.clearCache setTitle:@"清楚缓存" forState:UIControlStateNormal];
    [self addSubview:self.clearCache];
    
}

@end















