//
//  TWObject.m
//  EasyGames
//
//  Created by chris on 9/4/14.
//  Copyright (c) 2014 iEasynote. All rights reserved.
//

#import "TWObject.h"

@implementation TWObject

- (CGFloat) contentHeight{
    if(_contentHeight == 0){
        [self calculateContentHeight];
    }
    return _contentHeight;
}

- (void) calculateContentHeight{
    
}

@end
