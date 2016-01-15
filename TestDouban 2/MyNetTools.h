//
//  MyNetTools.h
//  UILesson17_Networking2
//
//  Created by lanou3g on 15/12/29.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^DataBlock) (NSData *data);
typedef void(^ImageSolve)(UIImage *image);

@interface MyNetTools : NSObject
//封装的旧方法
+ (void)solveDataWithUrl:(NSString *)stringUrl httpMethod:(NSString *)method httpBody:(NSString *)body revokeBlock:(DataBlock)block;
//新的方法


//如果是下载图片
+ (void)SessionDownloadWithUrl:(NSString *)url revokeBlock:(ImageSolve)imageBlock;

@end
