//
//  ActivityView.m
//  TestDouban
//
//  Created by lanou3g on 16/1/4.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "ActivityView.h"

@implementation ActivityView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setView];
    }
    return self;
}

- (void)setView{
    self.backgroundColor = [UIColor cyanColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -30, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) style:UITableViewStyleGrouped];
    [self addSubview:self.tableView];
    
}

@end
