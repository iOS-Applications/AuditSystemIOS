//
//  HeaderView.m
//  QQList
//
//  Created by CarolWang on 14/11/22.
//  Copyright (c) 2014年 CarolWang. All rights reserved.
//

#import "TaskView.h"
#import "JKGroupModel.h"

@implementation TaskView {
    UIButton *_arrowBtn;
    UILabel *_label;
}

+ (instancetype)headerView:(UITableView *)tableView{
    static NSString *identifier = @"header";
    TaskView *task = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!task) {
        task = [[TaskView alloc] initWithReuseIdentifier:identifier];
    }
    return task;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super init]) {
        //view 创建 按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.imageView.contentMode = UIViewContentModeCenter;
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        button.imageView.clipsToBounds = NO;
        _arrowBtn = button;
        [self addSubview:_arrowBtn];
        
        //label 创建 按钮
        UILabel *labelCenter = [[UILabel alloc] init];
        labelCenter.textAlignment = NSTextAlignmentCenter;
        _label = labelCenter;
        [self addSubview:_label];
        
    }
    return self;
}

#pragma mark - buttonAction
- (void)buttonAction{
    self.groupModel.isOpen = !self.groupModel.isOpen;
    if ([self.delegate respondsToSelector:@selector(clickView)]) {
        [self.delegate clickView];
    }
}

- (void)didMoveToSuperview{
    _arrowBtn.imageView.transform = self.groupModel.isOpen ? CGAffineTransformMakeRotation(M_PI_2) :CGAffineTransformMakeRotation(0);
}

//布局
- (void)layoutSubviews{
    [super layoutSubviews];
    _arrowBtn.frame = self.bounds;
    _label.frame = CGRectMake(self.frame.size.width - 70, 0, 60, self.frame.size.height);
}

//赋值
- (void)setGroupModel:(JKGroupModel *)groupModel{
    _groupModel = groupModel;
    [_arrowBtn setTitle:_groupModel.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%d/%lu",_groupModel.taskCompeletedCount,(unsigned long)_groupModel.tasks.count];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
