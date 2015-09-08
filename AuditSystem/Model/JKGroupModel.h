//
//  JKGroupModel.h
//  QQList
//
//  Created by CarolWang on 14/11/21.
//  Copyright (c) 2014年 CarolWang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JKTasksModel;
@interface JKGroupModel : NSObject

@property (nonatomic, copy)   NSString  *name;      //任务名字
@property (nonatomic, strong) NSArray *tasks;       //任务详情
@property (nonatomic, assign) int     taskCompeletedCount;      //完成任务数
@property (nonatomic, assign) BOOL    isOpen;       //判断是否展开

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)GroupWithDict:(NSDictionary *)dict;

@end
