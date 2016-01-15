//
//  MovieDetailModel.h
//  TestDouban
//
//  Created by lanou3g on 16/1/3.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MovieDetailModel : NSObject
@property(nonatomic,copy)NSString *movieid;
@property(nonatomic,copy)NSString *rating;
@property(nonatomic,copy)NSString *genres;
@property(nonatomic,copy)NSString *runtime;
@property(nonatomic,copy)NSString *language;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *writers;
@property(nonatomic,copy)NSString *film_location;
@property(nonatomic,copy)NSString *directors;
@property(nonatomic,copy)NSString *rating_count;
@property(nonatomic,copy)NSString *actors;
@property(nonatomic,copy)NSString *poster;
@property(nonatomic,copy)NSString *plot_simple;
@property(nonatomic,copy)NSString *year;
@property(nonatomic,copy)NSString *country;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *release_date;
@property(nonatomic,copy)NSString *also_known_as;

@property(nonatomic,strong)UIImage *image;

- (void)loadImage;
@end
