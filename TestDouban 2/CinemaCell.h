//
//  CinemaCell.h
//  TestDouban
//
//  Created by lanou3g on 15/12/30.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface CinemaCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *addressLabel;
@property(nonatomic,strong)UILabel *phoneLabel;

@property(nonatomic,strong)CinemaModel *model;
@end
