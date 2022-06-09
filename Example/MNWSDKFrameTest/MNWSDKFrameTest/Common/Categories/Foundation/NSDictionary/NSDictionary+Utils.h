#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Utils)

#pragma mark - JSON

/**
 转换成JSON数据
 */
- (NSData *)toJSONData;

/**
 转换成JSON字符串
 */
- (NSString *)toJSONString;


@end

NS_ASSUME_NONNULL_END
