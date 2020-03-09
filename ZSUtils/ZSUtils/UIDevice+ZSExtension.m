//
//  UIDevice+ZSExtension.m
//  ZSUtils
//
//  Created by 張帥 on 2015/5/22.
//  Copyright (c) 2015年 張帥. All rights reserved.
//

#import "UIDevice+ZSExtension.h"
#import <sys/utsname.h>

@implementation UIDevice (ZSExtension)

+ (NSString*)deviceModel {
    NSString *deviceModel = nil;
    #if TARGET_IPHONE_SIMULATOR
        deviceModel = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];
    #else
        struct utsname systemInfo;
        uname(&systemInfo);
        deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    #endif
    return deviceModel;
}

+ (NSString *)deviceModelName {
    
    NSString *deviceModel = [self deviceModel];
    
    if ([deviceModel isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceModel isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceModel isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([deviceModel isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
    if ([deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
    if ([deviceModel isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone11,2"])   return @"iPhone Xs";
    if ([deviceModel isEqualToString:@"iPhone11,4"])   return @"iPhone Xs Max";
    if ([deviceModel isEqualToString:@"iPhone11,6"])   return @"iPhone Xs Max";
    if ([deviceModel isEqualToString:@"iPhone11,8"])   return @"iPhone Xr";
    if ([deviceModel isEqualToString:@"iPhone12,1"])   return @"iPhone11";
    if ([deviceModel isEqualToString:@"iPhone12,3"])   return @"iPhone11 Pro";
    if ([deviceModel isEqualToString:@"iPhone12,5"])   return @"iPhone11 Pro Max";
    
    
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([deviceModel isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad Mini (CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad Air (GSM)";
    if ([deviceModel isEqualToString:@"iPad4,3"])      return @"iPad Air (CDMA)";
    if ([deviceModel isEqualToString:@"iPad4,4"])      return @"iPad Mini Retina (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,5"])      return @"iPad Mini Retina (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,7"])      return @"iPad Mini 3 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,8"])      return @"iPad Mini 3 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,9"])      return @"iPad Mini 3 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7-inch (WiFi)";
    if ([deviceModel isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7-inch (Cellular)";
    if ([deviceModel isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9-inch (WiFi)";
    if ([deviceModel isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9-inch (Cellular)";
    
    if ([deviceModel isEqualToString:@"iPad6,11"])     return @"iPad 5 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad6,12"])     return @"iPad 5 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9-inch (WiFi)";
    if ([deviceModel isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9-inch (Cellular)";
    if ([deviceModel isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5-inch (WiFi)";
    if ([deviceModel isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5-inch (Cellular)";
    
    if ([deviceModel isEqualToString:@"iPad8,1"] ||
        [deviceModel isEqualToString:@"iPad8,2"] ||
        [deviceModel isEqualToString:@"iPad8,3"] ||
        [deviceModel isEqualToString:@"iPad8,4"])      return @"iPad Pro 11-inch";
    
    if ([deviceModel isEqualToString:@"iPad8,5"] ||
        [deviceModel isEqualToString:@"iPad8,6"] ||
        [deviceModel isEqualToString:@"iPad8,7"] ||
        [deviceModel isEqualToString:@"iPad8,8"])      return @"iPad Pro 12.9-inch";
    
    if ([deviceModel isEqualToString:@"i386"])         return [UIDevice currentDevice].model;
    if ([deviceModel isEqualToString:@"x86_64"])       return [UIDevice currentDevice].model;
    
    return deviceModel;
}

/**
 *  app版本
 *
 *  @return app版本
 */
+ (NSString *)appVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

/**
 *  app build版本
 *
 *  @return app build版本
 */
+ (NSString *)appBuildVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleVersion"];
}

/**
 *  app名称
 *
 *  @return app名称
 */
+ (NSString *)appName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}

/**
 *  获取iOS系统版本号
 */
+ (float)iOSVersion {
    return [[[UIDevice currentDevice] systemVersion] doubleValue];
}

@end
