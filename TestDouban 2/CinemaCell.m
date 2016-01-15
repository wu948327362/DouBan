//
//  CinemaCell.m
//  TestDouban
//
//  Created by lanou3g on 15/12/30.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "CinemaCell.h"

@implementation CinemaCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setView];
    }
    return  self;
}

- (void)setView{
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_eventlistcell.png"]];
    iv.frame = CGRectMake(10, 0, CGRectGetWidth([UIScreen mainScreen].bounds)-20, 140);
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 300, 50)];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    //self.titleLabel.backgroundColor = [UIColor grayColor];
    self.titleLabel.text = @"影院";
    [iv addSubview:self.titleLabel];
    
    self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 62, CGRectGetWidth([UIScreen mainScreen].bounds)-40, 40)];
    self.addressLabel.font = [UIFont systemFontOfSize:17];
    self.addressLabel.numberOfLines = 0;
    //self.addressLabel.backgroundColor = [UIColor grayColor];
    self.addressLabel.text = @"地址";
    [iv addSubview:self.addressLabel];
    
    
    self.phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 112, 300, 20)];
    self.phoneLabel.font = [UIFont systemFontOfSize:17];
    //self.phoneLabel.backgroundColor = [UIColor grayColor];
    self.phoneLabel.text = @"100000000";
    [iv addSubview:self.phoneLabel];
    
    [self.contentView addSubview:iv];

    
    
}

- (void)setModel:(CinemaModel *)model{
    _model = model;
    self.titleLabel.text = model.cinemaName;
    self.addressLabel.text = model.address;
    self.phoneLabel.text = model.telephone;
    
    
    CGSize size1 = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)-40,1000);
    
    
    NSDictionary *dic1 =@{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    
    CGRect rect1 = [model.address boundingRectWithSize:size1 options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dic1 context:nil];
    
    CGRect frame1 = self.addressLabel.frame;
    
    frame1.size = rect1.size;
    self.addressLabel.frame = frame1;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end













