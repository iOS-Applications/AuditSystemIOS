//
//  TWRequest.m
//  EasyBaking
//
//  Created by chris on 1/30/15.
//  Copyright (c) 2015 iEasyNote. All rights reserved.
//

#import "TWRequest.h"

@implementation TWRequest
{
    BOOL _showLoadingView;
}

- (id) init {
    self = [super init];
    if (self) {
        _showLoadingView = YES;
    }
    return self;
}

- (NSMutableDictionary*) toDictionary {
    NSMutableDictionary *dict = [super toDictionary];
    [dict removeObjectForKey:@"showLoadingView"];
    return dict;
}

-(NSString*)getFullPath{
#if defined(APP_DEBUG) || defined(APP_BETA)
    NSString *protocal = [[TWLocalSettings sharedSettings] getSettings:@"SVR_PROTOCAL"];
    NSString *ip = [[TWLocalSettings sharedSettings] getSettings:@"SVR_IP"];
    NSString *port = [[TWLocalSettings sharedSettings] getSettings:@"SVR_PORT"];
    if (![NSString isNullOrEmpty:ip] && ![NSString isNullOrEmpty:port]) {
        return [NSString stringWithFormat:@"%@://%@:%@/%@", protocal, ip, port, [self apiName]];
    }
#endif
    
    return kAppApi([self apiName]);
}

- (NSString*) apiName {
    return @"";
}

- (void) setShowLoadingView:(BOOL)showLoadingView {
    _showLoadingView = showLoadingView;
}

- (BOOL) showLoadingView {
    return _showLoadingView;
}

- (BOOL)isShowRetryView {
    return NO;
}

@end
