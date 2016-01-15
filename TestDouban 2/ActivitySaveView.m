//
//  ActivitySaveView.m
//  TestDouban
//
//  Created by lanou3g on 16/1/7.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "ActivitySaveView.h"

@implementation ActivitySaveView

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
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    [self addSubview:self.tableView];
}

@end
