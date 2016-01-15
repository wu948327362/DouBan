//
//  ActivityViewController.h
//  TestDouban
//
//  Created by lanou3g on 15/12/28.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityView.h"


@interface ActivityViewController : UIViewController
@property(nonatomic,strong)ActivityView *av;
@property(nonatomic,strong)NSMutableArray *data;
@end
