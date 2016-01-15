//
//  ActivityCellView.m
//  TestDouban
//
//  Created by lanou3g on 16/1/3.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "ActivityCellView.h"

@implementation ActivityCellView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setView];
    }
    return self;
}

- (void)setView{
    self.vi = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 25, 25)];
    //self.vi.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.vi];
    
    self.la = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 180, 30)];
    self.la.text = @"test";
    [self addSubview:self.la];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
