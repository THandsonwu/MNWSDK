#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Utils)

#pragma mark - JSON

/**
 转换成JSON对象
 */
- (id)toJSONObject;

#pragma mark - 加密解密

/**
 Base64编码
 */
- (NSData *)base64Encoded;

/**
 Base64解码
 */
- (NSData *)base64Decoded;

@end

NS_ASSUME_NONNULL_END
