//
//  MovieDetail.h
//  TestDouban
//
//  Created by lanou3g on 16/1/3.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModel.h"

@interface MovieDetail : UIView
@property(nonatomic,strong)UIScrollView *tableView;

@property(nonatomic,strong)UIImageView *photoView;
@property(nonatomic,strong)UILabel *ratingLabel;
@property(nonatomic,strong)UILabel *releaseLabel;
@property(nonatomic,strong)UILabel *runntimeLabel;
@property(nonatomic,strong)UILabel *genresLabel;
@property(nonatomic,strong)UILabel *countryLabel;
@property(nonatomic,strong)UILabel *actTitleLabel;
@property(nonatomic,strong)UILabel *actorsLabel;
@property(nonatomic,strong)UILabel *plotTitleLabel;
@property(nonatomic,strong)UILabel *plotLabel;

@property(nonatomic,strong)MovieDetailModel *mdm;
@end
