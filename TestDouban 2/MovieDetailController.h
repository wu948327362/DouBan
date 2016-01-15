//
//  MovieDetailController.h
//  TestDouban
//
//  Created by lanou3g on 16/1/3.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetail.h"

@interface MovieDetailController : UIViewController
@property(nonatomic,strong)MovieDetail *md;
@property(nonatomic,copy)NSString *movieid;
@end
