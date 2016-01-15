//
//  AcDetailView.h
//  TestDouban
//
//  Created by lanou3g on 16/1/4.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityCellView.h"
#import "ActivityModel.h"

@interface AcDetailView : UIView
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIImageView *photoView;
@property(nonatomic,strong)ActivityCellView *timeView;
@property(nonatomic,strong)ActivityCellView *nameView;
@property(nonatomic,strong)ActivityCellView *typeView;
@property(nonatomic,strong)ActivityCellView *addressView;
@property(nonatomic,strong)UILabel *acTitle;
@property(nonatomic,strong)UILabel *acContent;

@property(nonatomic,strong)ActivityModel *am;
@end
