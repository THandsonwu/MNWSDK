#import <Foundation/Foundation.h>

@interface NSString (Utils)

 /**
  去掉前后空格
  */
- (NSString *)trimmed;

#pragma mark - 加密解密

/**
 MD5加密，小写
 */
- (NSString *)md5;

/**
 Base64编码
 */
- (NSString *)base64Encoded;

/**
 Base64解码
 */
- (NSString *)base64Decoded;

/**
 URL Encode
 */
- (NSString *)urlEncoded;

/**
 URL Decode
 */
- (NSString *)urlDecoded;

#pragma mark - 验证有效性

- (BOOL)isNotEmpty;

/**
 通用正则表达式验证方法
 @param regex 正则表达式
 */
- (BOOL)evaluatePredicate:(NSString *)regex;

- (BOOL)isValidMobileNumber;

#pragma mark - JSON

/**
 转换成JSON对象
 */
- (id)toJSONObject;

/**
 查找所有子串位置，忽略大小写
 
 @param s 子串
 @return 位置列表，NSValue封装NSRange
 */
- (NSArray<NSValue *> *)rangesOfString:(NSString *)s;

#pragma mark - 文本尺寸大小

- (CGSize)sizeWithFont:(UIFont *)font;

- (CGSize)sizeWithAttributes:(NSDictionary *)attributes;

- (CGSize)sizeWithFitSize:(CGSize)fitSize attributes:(NSDictionary *)attributes;

- (CGSize)sizeWithFitSize:(CGSize)fitSize font:(UIFont *)font;

- (CGSize)safeSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

#pragma mark - obs sdk 图片缩略图大小（用于头像 https://support.huaweicloud.com/fg-obs/obs_01_0430.html）

- (NSString *)avatarThumbUrl;

@end
