//
//  NSDate+Utilties.h
//  Mars
//
//  Created by chris on 6/22/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utilties)

- (NSString*) stringWithFormat:(NSString*) format;

- (NSInteger) year;
- (NSInteger) month;
- (NSInteger) day;
+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format ;
+ (NSString *)dbFormatString;
+ (NSString *)timestampFormatString;
@end
