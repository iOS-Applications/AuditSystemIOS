//
//  ASTitleValueCell.h
//  Mars
//
//  Created by Chris on 19/3/15.
//  Copyright (c) 2015 Mars. All rights reserved.
//

#import "ASTitleCell.h"

@interface ASTitleValueCell : ASTitleCell
{
    NSString *_value, *_placeholder;
    TWLabel *_valueLabel;
}
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong, readonly) TWLabel *valueLabel;

@property (nonatomic, assign) CGFloat rightSpacing;

@end
