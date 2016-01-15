//
//  MoviewCell.m
//  TestDouban
//
//  Created by lanou3g on 15/12/30.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "MoviewCell.h"

@implementation MoviewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setView];
    }
    return self;
}

- (void)setView{
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_eventlistcell.png"]];
    iv.frame = CGRectMake(10, 0, CGRectGetWidth([UIScreen mainScreen].bounds)-20, 140);
    
    self.photoView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 8, 90, 120)];
    self.photoView.backgroundColor = [UIColor grayColor];
    [iv addSubview:self.photoView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 15, 200, 110)];
    self.titleLabel.font = [UIFont systemFontOfSize:25];
    self.titleLabel.text = @"电影";
    [iv addSubview:self.titleLabel];
    
    [self.contentView addSubview:iv];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
