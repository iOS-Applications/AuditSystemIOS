//
//  ASTitleValueCell.m
//  Mars
//
//  Created by Chris on 19/3/15.
//  Copyright (c) 2015 Mars. All rights reserved.
//

#import "ASTitleValueCell.h"

@implementation ASTitleValueCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _valueLabel = [[TWLabel alloc] init];
        _valueLabel.font = kAppFont(14);
        [_contentView addSubview:_valueLabel];
        [self layoutValueLabel:NO];
    }
    return self;
}

- (void) setValue:(NSString *)value {
    _value = value;
    if ([NSString isNullOrEmpty:value]) {
        _valueLabel.textColor = kGrayColor;
        _valueLabel.text = _placeholder;
    }
    else {
        _valueLabel.text = value;
        _valueLabel.textColor = kBlackColor;
    }
}

- (void) setAccessoryType:(UITableViewCellAccessoryType)accessoryType {
    if (accessoryType==UITableViewCellAccessoryNone) {
        [self layoutValueLabel:NO];
    }
    else {
        [self layoutValueLabel:YES];
    }
    return [super setAccessoryType:accessoryType];
}

- (void) setRightSpacing:(CGFloat)rightSpacing {
    _valueLabel.frame = CGRectMake(_titleLabel.frame.origin.x+_titleLabel.frame.size.width, 10, kDeviceWidth-rightSpacing-_titleLabel.frame.origin.x-_titleLabel.frame.size.width, 24);
}

- (void) layoutValueLabel :(BOOL) rightSpacing {
    [self setRightSpacing:rightSpacing?34:16];
}

- (void) setAccessoryView:(UIView *)accessoryView {
    if (accessoryView) {
        [self layoutValueLabel:YES];
    } else {
        [self layoutValueLabel:NO];
    }
    return [super setAccessoryView:accessoryView];
}

- (void) setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
