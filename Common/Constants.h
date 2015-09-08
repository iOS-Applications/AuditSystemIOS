//
//  Constants.h
//  EasyGames
//
//  Created by chris on 4/29/14.
//

#ifndef EasyGames_Header_h
#define EasyGames_Header_h

#ifndef kDeviceWidth
    #define kDeviceWidth ([[UIScreen mainScreen] bounds].size.width)
#endif

#ifndef kDeviceHeight
    #define kDeviceHeight ([[UIScreen mainScreen] bounds].size.height)
#endif

#ifndef kRGB
    #define kRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#endif

#ifndef kRGBA
    #define kRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#endif

#define kHRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kHRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define kWhiteColor kRGB(255.0, 255.0, 255.0)
#define kBlackColor kRGB(0, 0, 0)
#define kBlueColor  kRGB(0, 0, 255)
#define kRedColor   kRGB(255, 0, 0)
#define kGreenColor kRGB(0, 255, 0)
#define kGrayColor  kRGB(128, 128, 128)
#define kCyanColor  kRGB(0, 255, 255)
#define kYellowColor kRGB(255, 255, 0)
#define kPinkColor  kRGB(255, 0, 255)
#define kClearColor [UIColor clearColor]

#define kOpenURL(url) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]]

#ifndef kAppVersion
    #define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#endif

#ifndef kAppBuild
    #define kAppBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#endif

#ifndef kAppName
    #define kAppName [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"]
#endif

#ifndef IOS6
    #define IOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
#endif

#ifndef IOS7
    #define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#endif

#ifndef IOS8
    #define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0
#endif

#ifdef APP_DEBUG
    #define kAppHostProtocal @"http"
    #define kAppHost @"10.0.18.79"
    #define kAppHostPort @"8103"
#elif defined APP_DEV
    #define kAppHostProtocal @"http"
    #define kAppHost @"10.0.18.192"
    #define kAppHostPort @"8103"
#elif defined APP_BETA
    #define kAppHostProtocal @"http"
    #define kAppHost @"120.26.51.183"
    #define kAppHostPort @"8103"
#else
    #define kAppHostProtocal @"http"
    #define kAppHost @"115.29.253.201"
    #define kAppHostPort @"80"
#endif
#define kAppBaseURL [NSString stringWithFormat:@"%@://%@:%@", kAppHostProtocal, kAppHost, kAppHostPort]
#define kAppApi(api) [NSString stringWithFormat:@"%@://%@:%@/%@", kAppHostProtocal, kAppHost, kAppHostPort, api]

#define kApiCallbackReport @""

#define kStr(str) NSLocalizedString(str, nil)

#define kOnlyWifiDownloadImage @"onlyWifiDownloadImage"

#define kFont(fsize, name) [UIFont fontWithName:name size:fsize]
#define kAppFont(size) [UIFont systemFontOfSize:size]
#define kAppFontBold(size) [UIFont boldSystemFontOfSize:size]

#define canTel                 ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:"]])
#define tel(phoneNumber)       ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]])
#define telprompt(phoneNumber) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",phoneNumber]]])

//Common Notificaitons
#define kNotificationRefreshRequired @"RefreshRequiredNotification"
#define kNotificationOnLogin @"kOnLoginNotification"
#define kNotificationOnLogout @"kOnLogoutNotification"

#if defined(APP_DEBUG) || defined(APP_BETA)
    #define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define DLog(...)
#endif

#endif
