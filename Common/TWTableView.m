//
//  TWTableView.m
//  EasyBaking
//
//  Created by chris on 5/13/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#import "TWTableView.h"

@implementation TWTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        [self initialize];
    }
    return self;
}

- (void) initialize{
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.backgroundColor = [UIColor clearColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
