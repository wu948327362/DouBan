//
//  MyNetTools.m
//  UILesson17_Networking2
//
//  Created by lanou3g on 15/12/29.
//  Copyright © 2015年 吴文涛. All rights reserved.
//

#import "MyNetTools.h"

@implementation MyNetTools
+ (void)solveDataWithUrl:(NSString *)stringUrl httpMethod:(NSString *)method httpBody:(NSString *)body revokeBlock:(DataBlock)block{
    NSURL *url = [NSURL URLWithString:stringUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    //将所有的字母转换为大写
    NSString *smethod = [method uppercaseString];
    
    if([smethod isEqualToString:@"POST"]){
        [request setHTTPMethod:smethod];
        NSData * d = [body dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:d];
    }else if([@"GET" isEqualToString:smethod]){
        
    }else{
//        NSLog(@"方法类型传类型错误");
//        return;
        
        @throw [NSException exceptionWithName:@"Param Error" reason:@"方法类型错误" userInfo:nil];
        return;
    }
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        block(data);
        
    }];
    
}

+ (void)SessionDownloadWithUrl:(NSString *)url revokeBlock:(ImageSolve)imageBlock{
    //创建url
    NSURL *strngUrl = [NSURL URLWithString:url];
    //创建request请求对象
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:strngUrl];
    
    //创建会话
    NSURLSession *session = [NSURLSession sharedSession];
    
    //创建任务
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        //从子线程回到主线程进行界面更新,ios界面的更新只能在主线程.
        dispatch_async(dispatch_get_main_queue(), ^{
            imageBlock(image);
        });
    }];
    
    [task resume];
//    NSURL *url1 = [NSURL URLWithString:url];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url1];
//    
//    if ([@"POST" isEqualToString:method]) {
//        [request setHTTPMethod:method];
//        NSData *da = [body dataUsingEncoding:NSUTF8StringEncoding];
//        [request setHTTPBody:da];
//    }
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        dataBlock(data);
//    }];
//    [task resume];

}

@end














