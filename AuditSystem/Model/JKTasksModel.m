//
//  JKFriendsModel.m
//  QQList
//
//  Created by CarolWang on 14/11/21.
//  Copyright (c) 2014年 CarolWang. All rights reserved.
//

#import "JKTasksModel.h"

@implementation JKTasksModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)taskWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
