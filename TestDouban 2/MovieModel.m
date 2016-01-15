//
//  MovieModel.m
//  TestDouban
//
//  Created by lanou3g on 16/1/3.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "MovieModel.h"
#import "MyNetTools.h"

@implementation MovieModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (void)loadImage{
    self.isLoading = YES;
    [MyNetTools solveDataWithUrl:self.pic_url httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
        self.image = [UIImage imageWithData:data];
        self.isLoading = NO;
    }];
}
@end
