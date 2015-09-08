//
//  TWRequest.h
//  EasyBaking
//
//  Created by chris on 1/30/15.
//  Copyright (c) 2015 iEasyNote. All rights reserved.
//

#import "TWObject.h"

@interface TWRequest : TWObject

@property (nonatomic, assign) BOOL showLoadingView;
-(NSString*)getFullPath;
-(BOOL)isShowRetryView;

@end
