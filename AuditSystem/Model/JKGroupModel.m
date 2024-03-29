//
//  JKGroupModel.m
//  QQList
//
//  Created by CarolWang on 14/11/21.
//  Copyright (c) 2014年 CarolWang. All rights reserved.
//

#import "JKGroupModel.h"
#import "JKTasksModel.h"
@implementation JKGroupModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *muArray = [NSMutableArray array];
        for (NSDictionary *dict in self.tasks) {
            JKTasksModel *model = [JKTasksModel taskWithDict:dict];
            [muArray addObject:model];
        }
        self.tasks = muArray;
    }
    return self;
}
+ (instancetype)GroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
