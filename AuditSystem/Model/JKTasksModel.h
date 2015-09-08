//
//  JKFriendsModel.h
//  QQList
//
//  Created by CarolWang on 14/11/21.
//  Copyright (c) 2014年 CarolWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKTasksModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, assign) int type;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)taskWithDict:(NSDictionary *)dict;
@end
