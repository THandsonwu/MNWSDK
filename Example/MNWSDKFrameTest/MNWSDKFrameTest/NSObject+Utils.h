#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Utils)

/**
 判断是否 NSNumber
 */
- (BOOL)isNumber;

/**
 判断是否字符串
 */
- (BOOL)isString;

/**
 判断是否非空字符串
 */
- (BOOL)isValidString;

/**
 判断是否数组
 */
- (BOOL)isArray;

/**
 判断是否非空数组
 */
- (BOOL)isValidArray;

/**
 判断是否字典
 */
- (BOOL)isDictionary;

/**
 判断是否非空字典
 */
- (BOOL)isValidDictionary;

/**
 判断是否集合
 */
- (BOOL)isSet;

/**
 判断是否非空集合
 */
- (BOOL)isValidSet;

@end

NS_ASSUME_NONNULL_END
