//
//  MovieViewController.h
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieView.h"
#import "MyNetTools.h"
#import "MoviewCell.h"
#import "MovieModel.h"

@interface MovieViewController : UIViewController
@property(nonatomic,strong)MovieView *mv;
@property(nonatomic,strong)NSMutableArray *data;
@end
