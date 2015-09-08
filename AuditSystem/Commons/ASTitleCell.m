//
//  ASTitleCell.m
//  Mars
//
//  Created by Chris on 12/3/15.
//  Copyright (c) 2015 Mars. All rights reserved.
//

#import "ASTitleCell.h"

@implementation ASTitleCell
{
    TWLabel *_splitter;
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _contentView = [[TWView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 44)];
        _contentView.backgroundColor = kWhiteColor;
        [self.contentView addSubview:_contentView];
        
//        _titleLabel = [[TWLabel alloc] initWithFrame:CGRectMake(10, 10, 80, 24)];
//        _titleLabel.font = kAppFont(14);
//        _titleLabel.textColor = kBlackColor;
//        [_contentView addSubview:_titleLabel];
//        
//        _splitter = [[TWLabel alloc] initWithFrame:CGRectMake(_titleLabel.frame.origin.x+_titleLabel.frame.size.width-10, 15, 0.5, 14)];
//        _splitter.backgroundColor = kRGB(225, 225, 225);
//        [_contentView addSubview:_splitter];
    }
    return self;
}

- (TWLabel*) titleLabel {
    return _titleLabel;
}

- (void) setTitle:(NSString *)title {
    _titleLabel.attributedText = nil;
    if (title.length==2) {
        NSString *word1 = [title substringToIndex:1];
        NSString *word2 = [title substringFromIndex:1];
        _titleLabel.text = [NSString stringWithFormat:@"%@－－%@", word1, word2];
       // [_titleLabel setPartString:@"－－" attributes:@{NSForegroundColorAttributeName:_contentView.backgroundColor}];
    } else {
        _titleLabel.text = title;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
