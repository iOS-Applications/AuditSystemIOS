//
//  TWView.m
//  EasyGames
//
//  Created by chris on 9/1/14.
//  Copyright (c) 2014 iEasynote. All rights reserved.
//

#import "TWView.h"

@implementation TWView

- (id) init{
    self = [super init];
    if (self) {
        [self initRadius:0];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initRadius:0];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initRadius:0];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame andRadius:(CGFloat)radius{
    self = [super initWithFrame:frame];
    if(self){
        [self initRadius:radius];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) setBackgroundColor:(UIColor *)backgroundColor{
    _backgroundColor = backgroundColor;
    if([self hasRadius] && _backgroundColor && _backgroundColor!=[UIColor clearColor]){
        [super setBackgroundColor:[UIColor clearColor]];
        [self setNeedsDisplay];
    }else{
        if(backgroundColor){
            [super setBackgroundColor:backgroundColor];
        }else{
            [super setBackgroundColor:[UIColor clearColor]];
        }
    }
}

- (UIColor*) backgroundColor{
    if (_backgroundColor) {
        return _backgroundColor;
    }
    return [super backgroundColor];
}

- (BOOL) hasRadius{
    return _ltRadius>0 || _rtRadius>0 || _lbRadius>0 || _rbRadius>0;
}

- (void) initRadius:(CGFloat) radius{
    _radius = radius;
    _ltRadius = radius;
    _rtRadius = radius;
    _lbRadius = radius;
    _rbRadius = radius;
}

- (void) setLtRadius:(CGFloat)ltRadius{
    if(_ltRadius!=ltRadius){
        _ltRadius =ltRadius;
        [self setBackgroundColor:_backgroundColor];
    }
}

- (CGFloat) getLTRadius{
    return _ltRadius;
}

- (void) setRTRadius:(CGFloat)rtRadius{
    if(_rtRadius!=rtRadius){
        _rtRadius = rtRadius;
        [self setBackgroundColor:_backgroundColor];
    }
}

- (CGFloat) getRTRadius{
    return _rtRadius;
}

- (void) setLBRadius:(CGFloat)lbRadius{
    if(_lbRadius!=lbRadius){
        _lbRadius = lbRadius;
        [self setBackgroundColor:_backgroundColor];
    }
}

- (CGFloat) getLBRadius{
    return _lbRadius;
}

- (void) setRBRadius:(CGFloat)rbRadius{
    if(_rbRadius!=rbRadius){
        _rbRadius = rbRadius;
        [self setBackgroundColor:_backgroundColor];
    }
}

- (CGFloat) getRBRadius{
    return _rbRadius;
}

- (void) setRadius:(CGFloat)radius{
    if(_radius!=radius){
        [self initRadius:radius];
    }
    [self setBackgroundColor:_backgroundColor];
}

- (CGFloat) getRadius{
    return _radius;
}

- (void) setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self setNeedsDisplay];
}

- (void) drawRect:(CGRect)rect{
    
    [super drawRect:rect];
    
    UIColor *backgroundColor = _backgroundColor;
    
    if([self hasRadius] && backgroundColor){
        // get the contect
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        // the rest is pretty much copied from Apples example
        CGFloat minx = CGRectGetMinX(rect), midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect);
        CGFloat miny = CGRectGetMinY(rect), midy = CGRectGetMidY(rect), maxy = CGRectGetMaxY(rect);
        
        {
            // Start at 1
            CGContextMoveToPoint(context, minx, midy);
            // Add an arc through 2 to 3
            CGContextAddArcToPoint(context, minx, miny, midx, miny, _ltRadius);
            // Add an arc through 4 to 5
            CGContextAddArcToPoint(context, maxx, miny, maxx, midy, _rtRadius);
            // Add an arc through 6 to 7
            CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, _rbRadius);
            // Add an arc through 8 to 9
            CGContextAddArcToPoint(context, minx, maxy, minx, midy, _lbRadius);
            // Close the path
            CGContextClosePath(context);
            
            //CGContextSetRGBFillColor(context, 1.0, 0.0, 1.0, 1.0);
            CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
            
            // Fill & stroke the path
            CGContextDrawPath(context, kCGPathFill);
        }
    }
}

/*
- (void)drawRect:(CGRect)rect
{
    // get the contect
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //now draw the rounded rectangle
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 0.0);
    
    //since I need room in my rect for the shadow, make the rounded rectangle a little smaller than frame
    CGRect rrect = CGRectMake(CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetWidth(rect)-30, CGRectGetHeight(rect)-30);
    CGFloat radius = 45;
    // the rest is pretty much copied from Apples example
    CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
    
    {
        //for the shadow, save the state then draw the shadow
        CGContextSaveGState(context);
        
        // Start at 1
        CGContextMoveToPoint(context, minx, midy);
        // Add an arc through 2 to 3
        CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
        // Add an arc through 4 to 5
        CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
        // Add an arc through 6 to 7
        CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
        // Add an arc through 8 to 9
        CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
        // Close the path
        CGContextClosePath(context);
        
        CGContextSetShadow(context, CGSizeMake(4,-5), 10);
        CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
        
        // Fill & stroke the path
        CGContextDrawPath(context, kCGPathFillStroke);
        
        //for the shadow
        CGContextRestoreGState(context);
    }
    
    {
        // Start at 1
        CGContextMoveToPoint(context, minx, midy);
        // Add an arc through 2 to 3
        CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
        // Add an arc through 4 to 5
        CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
        // Add an arc through 6 to 7
        CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
        // Add an arc through 8 to 9
        CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
        // Close the path
        CGContextClosePath(context);
        
        CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
        CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
        
        // Fill & stroke the path
        CGContextDrawPath(context, kCGPathFillStroke);
    }
}*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
