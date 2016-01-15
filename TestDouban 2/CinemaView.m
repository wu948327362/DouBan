//
//  CinemaView.m
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "CinemaView.h"

@implementation CinemaView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setView];
    }
    return self;
}

- (void)setView{
    //self.backgroundColor = [UIColor greenColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)-64) style:UITableViewStylePlain];
    self.tableView.pagingEnabled = NO;
    [self addSubview:self.tableView];
    
}

@end
