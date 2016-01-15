//
//  ActivityModel.m
//  TestDouban
//
//  Created by lanou3g on 16/1/4.
//  Copyright © 2016年 吴文涛. All rights reserved.
//

#import "ActivityModel.h"
#import "MyNetTools.h"

@implementation ActivityModel

- (void)setValue:(id)value forKey:(NSString *)key{
    if ([@"id" isEqualToString:key]) {
        self.aid = [value integerValue];
    }else{
        [super setValue:value forKey:key];
    }
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (void)loadImage{
    self.isLoading = YES;
    [MyNetTools solveDataWithUrl:self.image httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
        self.im = [UIImage imageWithData:data];
        self.isLoading = NO;
    }];
    
}
@end
