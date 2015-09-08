//
//  TWTableViewCell.m
//  EasyBaking
//
//  Created by chris on 5/27/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#import "TWTableViewCell.h"
#import "TWObject.h"

@implementation TWTableViewCell{
    UIView *_view;

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void) showWithData:(TWObject *)data{
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
