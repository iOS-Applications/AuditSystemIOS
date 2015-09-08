//
//  TWView.h
//  EasyGames
//
//  Created by chris on 9/1/14.
//  Copyright (c) 2014 iEasynote. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWView : UIView
{
    UIColor *_backgroundColor;
    CGFloat _radius, _ltRadius, _rtRadius, _lbRadius, _rbRadius;
}
@property(nonatomic, assign, readwrite, setter = setRadius:, getter = getRadius) CGFloat radius;
@property(nonatomic, assign, readwrite, setter = setLTRadius:, getter = getLTRadius) CGFloat ltRadius;
@property(nonatomic, assign, readwrite, setter = setRTRadius:, getter = getRTRadius) CGFloat rtRadius;
@property(nonatomic, assign, readwrite, setter = setLBRadius:, getter = getLBRadius) CGFloat lbRadius;
@property(nonatomic, assign, readwrite, setter = setRBRadius:, getter = getRBRadius) CGFloat rbRadius;
- (id) initWithFrame:(CGRect)frame andRadius:(CGFloat) radius;

@end
