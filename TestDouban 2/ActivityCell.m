//
//  ActivityCell.m
//  TestDouban
//
//  Created by lanou3g on 15/12/30.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setView];
    }
    return self;
}

- (void)setAm:(ActivityModel *)am{
    _am = am;
    
    self.titleLabel.text = am.title;
    self.dateLabel.la.text = am.begin_time;
    self.addressLabel.la.text = am.address;
    self.typeLabel.la.text = am.category_name;
    self.interestLabel.text = [NSString stringWithFormat:@"兴趣:%@",am.wisher_count];
    self.joinLabel.text = [NSString stringWithFormat:@"参加:%@",am.participant_count];
    
}

- (void)setView{
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_eventlistcell.png"]];
    iv.frame = CGRectMake(10, 0, CGRectGetWidth([UIScreen mainScreen].bounds)-20, 180);
    
    UIImageView *iv2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_share_large.png"]];
    iv2.frame = CGRectMake(2, 40, CGRectGetWidth([UIScreen mainScreen].bounds)-25, 140);
    [iv addSubview:iv2];

    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 40)];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    self.titleLabel.text = @"标题";
    [iv addSubview:self.titleLabel];

    self.dateLabel = [[ActivityCellView alloc] initWithFrame:CGRectMake(0, 0, 180, 60)];
    self.dateLabel.vi.image = [UIImage imageNamed:@"icon_date@2x.png"];
    [iv2 addSubview:self.dateLabel];

    self.addressLabel = [[ActivityCellView alloc] initWithFrame:CGRectMake(0, 30, 180, 60)];
    self.addressLabel.vi.image = [UIImage imageNamed:@"icon_spot@2x.png"];
    [iv2 addSubview:self.addressLabel];
    
    self.typeLabel = [[ActivityCellView alloc] initWithFrame:CGRectMake(0, 60, 180, 60)];
    self.typeLabel.vi.image = [UIImage imageNamed:@"icon_catalog@2x.png"];
    [iv2 addSubview:self.typeLabel];

    self.interestLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 100, 60)];
    self.interestLabel.text = @"兴趣:";
    [iv2 addSubview:self.interestLabel];
    
    self.joinLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 90, 100, 60)];
    self.joinLabel.text = @"参加:";
    [iv2 addSubview:self.joinLabel];
    
    self.photoView = [[UIImageView alloc] initWithFrame:CGRectMake(270, 10, 100, 120)];
    self.photoView.backgroundColor = [UIColor cyanColor];
    [iv2 addSubview:self.photoView];
    
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

















