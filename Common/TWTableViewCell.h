//
//  TWTableViewCell.h
//  EasyBaking
//
//  Created by chris on 5/27/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TWObject;

@interface TWTableViewCell : UITableViewCell
- (void) showWithData: (TWObject *) data;
@end
