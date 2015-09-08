 //
//  TWLocalSettings.h
//  EasyBaking
//
//  Created by chris on 9/19/14.
//  Copyright (c) 2014 iEasyNote. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWLocalSettings : NSObject
+ (TWLocalSettings*)sharedSettings;
- (id) getSettings:(NSString*) key;
- (void) setSettings:(id) settings forKey:(NSString*) key;
- (void) removeSettingsForKey:(NSString*) key;
- (BOOL) hasSettingForKey:(NSString*) key;

@end
