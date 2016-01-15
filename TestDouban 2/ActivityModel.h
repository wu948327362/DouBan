//
//  ActivityModel.h
//  TestDouban
//
//  Created by lanou3g on 16/1/4.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ActivityModel : NSObject
@property(nonatomic,assign)NSInteger aid;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *begin_time;
@property(nonatomic,copy)NSString *end_time;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *category_name;
@property(nonatomic,copy)NSString *participant_count;
@property(nonatomic,copy)NSString *wisher_count;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *content;

@property(nonatomic,strong)UIImage *im;
@property(nonatomic,assign)BOOL isLoading;
- (void)loadImage;
@end
