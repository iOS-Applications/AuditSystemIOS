//
//  TWLocalSettings.m
//  EasyBaking
//
//  Created by chris on 9/19/14.
//  Copyright (c) 2014 iEasyNote. All rights reserved.
//

#import "TWLocalSettings.h"

@implementation TWLocalSettings

static TWLocalSettings* _sharedInstance = nil;

+ (TWLocalSettings*) sharedSettings
{
    @synchronized([TWLocalSettings class])
    {
        if(!_sharedInstance)
            _sharedInstance = [[self alloc]init];
        return _sharedInstance;
    }
    return nil;
}

+ (id)alloc
{
    @synchronized([TWLocalSettings class])
    {
        NSAssert(_sharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
        _sharedInstance = [super alloc];
        return _sharedInstance;
    }
    return nil;
}

- (id) getSettings:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

- (void) setSettings:(id)settings forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] setObject:settings forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) removeSettingsForKey:(NSString *)key{
    if (![NSString isNullOrEmpty:key]){
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
}

- (BOOL) hasSettingForKey:(NSString *)key{
    return [self getSettings:key]? YES : NO;
}

@end
