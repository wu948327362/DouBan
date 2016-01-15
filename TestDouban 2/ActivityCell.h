//
//  ActivityCell.h
//  TestDouban
//
//  Created by lanou3g on 15/12/30.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityCellView.h"
#import "ActivityModel.h"

@interface ActivityCell : UITableViewCell
//@property(nonatomic,strong)UIImageView *allView;
@property(nonatomic,strong)UIImageView *photoView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)ActivityCellView *dateLabel;
@property(nonatomic,strong)ActivityCellView *addressLabel;
@property(nonatomic,strong)ActivityCellView *typeLabel;
@property(nonatomic,strong)UILabel *interestLabel;
//@property(nonatomic,strong)UILabel *interestNum;
@property(nonatomic,strong)UILabel *joinLabel;
//@property(nonatomic,strong)UILabel *joinNum;

@property(nonatomic,strong)ActivityModel *am;
@end
