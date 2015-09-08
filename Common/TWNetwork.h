//
//  TWNetworkUtilities.h
//  Mars
//
//  Created by chris on 5/14/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWNetwork : NSObject
+ (TWNetworkUtilities*) sharedInstance;
@property (readonly, nonatomic, assign, getter = isReachable) BOOL reachable;
@property (readonly, nonatomic, assign, getter = isReachableViaWWAN) BOOL reachableViaWWAN;
@property (readonly, nonatomic, assign, getter = isReachableViaWiFi) BOOL reachableViaWiFi;
@property (readwrite, nonatomic, assign, getter = isRetry, setter = setRetry:) BOOL retry;

- (void) setRetryTimes:(int) retryTimes andRetryInterval:(int) retryInterval;
- (void) get:(NSString*) requestUrl withParameters:(id)parameters onSuccess:(void (^)(id responseData)) success onFailure:(void (^)(NSError* error))failure;
- (void) post:(NSString*) requestUrl withParameters:(id)parameters onSuccess:(void (^)(id responseData)) success onFailure:(void (^)(NSError* error))failure;
- (void) post:(NSString*) requestUrl withParameters:(id)parameters andMultiParts:(NSDictionary*) multiParts onSuccess:(void (^)(id responseData)) success onFailure:(void (^)(NSError* error))failure;
- (void) abort:(NSString*) requestUrl;
@end
