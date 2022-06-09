//
//  DeviceUtils.h
//  sdksample
//
//  Created by mini1 on 2020/5/1.
//  Copyright © 2020年 www.mini1.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceUtils : NSObject

/** 获取设备model，如 iPhone1,1 */
+ (NSString *)deviceModel;

/** 根据设备 model 获取设备名，如 iPhone XS Max */
+ (NSString *)deviceNameWithModel:(NSString *)model;

/** 获取操作系统版本号，如 "12.0" */
+ (NSString *)osVersion;

/** 获取操作系统版本号，如 12.0 */
+ (float)osVersionValue;

/** 获取设备id */
+ (NSString *)deviceId;

@end
