//
//  ASTitleCell.h
//  Mars
//
//  Created by Chris on 12/3/15.
//  Copyright (c) 2015 Mars. All rights reserved.
//

#import "TWTableViewCell.h"

@interface ASTitleCell : TWTableViewCell
{
    TWView *_contentView;
    TWLabel *_titleLabel;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong, readonly) TWLabel *titleLabel;

@end
