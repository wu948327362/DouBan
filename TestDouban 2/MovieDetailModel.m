//
//  MovieDetailModel.m
//  TestDouban
//
//  Created by lanou3g on 16/1/3.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "MovieDetailModel.h"
#import "MyNetTools.h"

@implementation MovieDetailModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (void)loadImage{
    [MyNetTools solveDataWithUrl:self.poster httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
        //NSLog(@"%@",data);
        self.image = [UIImage imageWithData:data];
        //NSLog(@"%@",self.image);
    }];
}
@end
