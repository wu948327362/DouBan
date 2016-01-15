//
//  MovieModel.h
//  TestDouban
//
//  Created by lanou3g on 16/1/3.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MovieModel : NSObject
@property(nonatomic,copy)NSString *movieName;
@property(nonatomic,copy)NSString *pic_url;
@property(nonatomic,copy)NSString *movieId;

@property(nonatomic,strong)UIImage *image;
@property(nonatomic,assign)BOOL isLoading;

- (void)loadImage;
@end
