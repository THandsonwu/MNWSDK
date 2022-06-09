//
//  DeviceUtils.m
//  sdksample
//
//  Created by mini1 on 2020/5/1.
//  Copyright © 2020年 www.mini1.cn. All rights reserved.
//

#import "DeviceUtils.h"
#include <sys/utsname.h>
#import "UICKeyChainStore.h"

@implementation DeviceUtils

+ (NSString *)deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *s = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return s;
}

+ (NSString *)deviceNameWithModel:(NSString *)model {
    if (!model) {
        return @"";
    }
    
    if ([model hasPrefix:@"iPhone"]) {
        if ([model isEqualToString:@"iPhone1,1"]) {
            return @"iPhone";
        } else if ([model isEqualToString:@"iPhone1,2"]) {
            return @"iPhone 3G";
        } else if ([model isEqualToString:@"iPhone2,1"]) {
            return @"iPhone 3GS";
        } else if ([model isEqualToString:@"iPhone3,1"] ||
                   [model isEqualToString:@"iPhone3,2"] ||
                   [model isEqualToString:@"iPhone3,3"]) {
            return @"iPhone 4";
        } else if ([model isEqualToString:@"iPhone4,1"]) {
            return @"iPhone 4s";
        } else if ([model isEqualToString:@"iPhone5,1"] ||
                   [model isEqualToString:@"iPhone5,2"]) {
            return @"iPhone 5";
        } else if ([model isEqualToString:@"iPhone5,3"] ||
                   [model isEqualToString:@"iPhone5,4"]) {
            return @"iPhone 5c";
        } else if ([model isEqualToString:@"iPhone6,1"] ||
                   [model isEqualToString:@"iPhone6,2"]) {
            return @"iPhone 5s";
        } else if ([model isEqualToString:@"iPhone7,2"]) {
            return @"iPhone 6";
        } else if ([model isEqualToString:@"iPhone7,1"]) {
            return @"iPhone 6 Plus";
        } else if ([model isEqualToString:@"iPhone8,1"]) {
            return @"iPhone 6s";
        } else if ([model isEqualToString:@"iPhone8,2"]) {
            return @"iPhone 6s Plus";
        } else if ([model isEqualToString:@"iPhone8,4"]) {
            return @"iPhone SE";
        } else if ([model isEqualToString:@"iPhone9,1"] ||
                   [model isEqualToString:@"iPhone9,3"]) {
            return @"iPhone 7";
        } else if ([model isEqualToString:@"iPhone9,2"] ||
                   [model isEqualToString:@"iPhone9,4"]) {
            return @"iPhone 7 Plus";
        } else if ([model isEqualToString:@"iPhone10,1"] ||
                   [model isEqualToString:@"iPhone10,4"]) {
            return @"iPhone 8";
        } else if ([model isEqualToString:@"iPhone10,2"] ||
                   [model isEqualToString:@"iPhone10,5"]) {
            return @"iPhone 8 Plus";
        } else if ([model isEqualToString:@"iPhone10,3"] ||
                   [model isEqualToString:@"iPhone10,6"]) {
            return @"iPhone X";
        } else if ([model isEqualToString:@"iPhone11,2"]) {
            return @"iPhone XS";
        } else if ([model isEqualToString:@"iPhone11,4"] ||
                   [model isEqualToString:@"iPhone11,6"]) {
            return @"iPhone XS Max";
        } else if ([model isEqualToString:@"iPhone11,8"]) {
            return @"iPhone XR";
        } else if ([model isEqualToString:@"iPhone12,1"]) {
            return @"iPhone 11";
        } else if ([model isEqualToString:@"iPhone12,3"]) {
            return @"iPhone 11 Pro";
        } else if ([model isEqualToString:@"iPhone12,5"]) {
            return @"iPhone 11 Pro Max";
        } else if ([model isEqualToString:@"iPhone12,8"]) {
            return @"iPhone SE 2";
        } else if ([model isEqualToString:@"iPhone13,1"]) {
            return @"iPhone 12 Mini";
        } else if ([model isEqualToString:@"iPhone13,2"]) {
            return @"iPhone 12";
        } else if ([model isEqualToString:@"iPhone13,3"]) {
            return @"iPhone 12 Pro";
        } else if ([model isEqualToString:@"iPhone13,4"]) {
            return @"iPhone 12 Pro Max";
        } else {
            return model;
        }
    } else if ([model hasPrefix:@"iPad"]) {
        if ([model isEqualToString:@"iPad1,1"]) {
            return @"iPad";
        } else if ([model isEqualToString:@"iPad2,1"] ||
                   [model isEqualToString:@"iPad2,2"] ||
                   [model isEqualToString:@"iPad2,3"] ||
                   [model isEqualToString:@"iPad2,4"]) {
            return @"iPad 2";
        } else if ([model isEqualToString:@"iPad2,5"] ||
                   [model isEqualToString:@"iPad2,6"] ||
                   [model isEqualToString:@"iPad2,7"]) {
            return @"iPad mini";
        } else if ([model isEqualToString:@"iPad3,1"] ||
                   [model isEqualToString:@"iPad3,2"] ||
                   [model isEqualToString:@"iPad3,3"]) {
            return @"iPad 3";
        } else if ([model isEqualToString:@"iPad3,4"] ||
                   [model isEqualToString:@"iPad3,5"] ||
                   [model isEqualToString:@"iPad3,6"]) {
            return @"iPad 4";
        } else if ([model isEqualToString:@"iPad4,1"] ||
                   [model isEqualToString:@"iPad4,2"] ||
                   [model isEqualToString:@"iPad4,3"]) {
            return @"iPad Air";
        } else if ([model isEqualToString:@"iPad4,4"] ||
                   [model isEqualToString:@"iPad4,5"] ||
                   [model isEqualToString:@"iPad4,6"]) {
            return @"iPad mini 2";
        } else if ([model isEqualToString:@"iPad4,7"] ||
                   [model isEqualToString:@"iPad4,8"] ||
                   [model isEqualToString:@"iPad4,9"]) {
            return @"iPad mini 3";
        } else if ([model isEqualToString:@"iPad5,1"] ||
                   [model isEqualToString:@"iPad5,2"]) {
            return @"iPad mini 4";
        } else if ([model isEqualToString:@"iPad5,3"] ||
                   [model isEqualToString:@"iPad5,4"]) {
            return @"iPad Air 2";
        } else if ([model isEqualToString:@"iPad6,3"] ||
                   [model isEqualToString:@"iPad6,4"]) {
            return @"iPad Pro 9.7-inch";
        } else if ([model isEqualToString:@"iPad6,7"] ||
                   [model isEqualToString:@"iPad6,8"]) {
            return @"iPad Pro 12.9-inch";
        } else if ([model isEqualToString:@"iPad6,11"] ||
                   [model isEqualToString:@"iPad6,12"]) {
            return @"iPad 5";
        } else if ([model isEqualToString:@"iPad7,1"] ||
                   [model isEqualToString:@"iPad7,2"]) {
            return @"iPad Pro 12.9-inch 2";
        } else if ([model isEqualToString:@"iPad7,3"] ||
                   [model isEqualToString:@"iPad7,4"]) {
            return @"iPad Pro 10.5-inch";
        } else if ([model isEqualToString:@"iPad7,5"] ||
                   [model isEqualToString:@"iPad7,6"]) {
            return @"iPad 6";
        } else if ([model isEqualToString:@"iPad7,11"] ||
                   [model isEqualToString:@"iPad7,12"]) {
            return @"iPad 7";
        } else if ([model isEqualToString:@"iPad8,1"] ||
                   [model isEqualToString:@"iPad8,2"] ||
                   [model isEqualToString:@"iPad8,3"] ||
                   [model isEqualToString:@"iPad8,4"]) {
            return @"iPad Pro 11-inch";
        } else if ([model isEqualToString:@"iPad8,5"] ||
                   [model isEqualToString:@"iPad8,6"] ||
                   [model isEqualToString:@"iPad8,7"] ||
                   [model isEqualToString:@"iPad8,8"]) {
            return @"iPad Pro 12.9-inch 3";
        } else if ([model isEqualToString:@"iPad8,9"] ||
                   [model isEqualToString:@"iPad8,10"]) {
            return @"iPad Pro 11-inch 2";
        } else if ([model isEqualToString:@"iPad8,11"] ||
                   [model isEqualToString:@"iPad8,12"]) {
            return @"iPad Pro 12.9-inch 4";
        } else if ([model isEqualToString:@"iPad11,1"] ||
                   [model isEqualToString:@"iPad11,2"]) {
            return @"iPad mini 5";
        } else if ([model isEqualToString:@"iPad11,3"] ||
                   [model isEqualToString:@"iPad11,4"]) {
            return @"iPad Air 3";
        } else if ([model isEqualToString:@"iPad11,6"] ||
                   [model isEqualToString:@"iPad11,7"]) {
            return @"iPad 8";
        } else if ([model isEqualToString:@"iPad13,1"] ||
                   [model isEqualToString:@"iPad13,2"]) {
            return @"iPad Air 4";
        } else {
            return model;
        }
    } else if ([model hasPrefix:@"iPod"]) {
        if ([model isEqualToString:@"iPod1,1"]) {
            return @"iPod touch";
        } else if ([model isEqualToString:@"iPod2,1"]) {
            return @"iPod touch 2";
        } else if ([model isEqualToString:@"iPod3,1"]) {
            return @"iPod touch 3";
        } else if ([model isEqualToString:@"iPod4,1"]) {
            return @"iPod touch 4";
        } else if ([model isEqualToString:@"iPod5,1"]) {
            return @"iPod touch 5";
        } else if ([model isEqualToString:@"iPod7,1"]) {
            return @"iPod touch 6";
        } else if ([model isEqualToString:@"iPod9,1"]) {
            return @"iPod touch 7";
        } else {
            return model;
        }
    } else {
        return @"";
    }
}

+ (NSString *)osVersion {
    return [UIDevice currentDevice].systemVersion;
}

+ (float)osVersionValue {
    return [UIDevice currentDevice].systemVersion.floatValue;
}

+ (NSString *)deviceId {
    UICKeyChainStore *keychainStore = [UICKeyChainStore keyChainStore];
    NSString *key = @"generatedUniqueDeviceId";
    if (![keychainStore contains:key] || keychainStore[key] == nil || [keychainStore[key] isEqual: @""]) {
        if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]){
            NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            keychainStore[key] = uuid;
        }
    }
    NSString *deviceId = keychainStore[key];
    return deviceId;
}

@end
