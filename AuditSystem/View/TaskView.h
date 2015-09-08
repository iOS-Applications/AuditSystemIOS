//
//  HeaderView.h
//  QQList
//
//  Created by CarolWang on 14/11/22.
//  Copyright (c) 2014年 CarolWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKGroupModel.h"
@protocol TaskViewDelegate <NSObject>

@optional
- (void)clickView;
@end

@interface  TaskView : UITableViewHeaderFooterView
    @property (nonatomic, assign) id<TaskViewDelegate> delegate;
    @property (nonatomic, strong) JKGroupModel *groupModel;

    + (instancetype)headerView:(UITableView *)tableView;
@end
