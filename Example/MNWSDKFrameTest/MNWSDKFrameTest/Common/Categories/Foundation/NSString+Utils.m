#import "NSString+Utils.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+Utils.h"

@implementation NSString (Utils)

- (NSString *)trimmed {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark - 加密解密

- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *s = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [s appendFormat:@"%02x", digest[i]];
    }
    
    return s;
}

- (NSString *)base64Encoded {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *s = [data base64EncodedStringWithOptions:0];
    return s;
}

- (NSString *)base64Decoded {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *s = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return s;
}

- (NSString *)urlEncoded {
    NSString *s = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return s;
}

- (NSString *)urlDecoded {
    NSString *s = [self stringByRemovingPercentEncoding];
    return s;
}

#pragma mark - 验证有效性

- (BOOL)isNotEmpty {
    return self && self.length > 0;
}

- (BOOL)evaluatePredicate:(NSString *)regex {
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regexTest evaluateWithObject:self];
}

- (BOOL)isValidMobileNumber {
    NSString *regex = @"^(13\\d|14(1|[4-9])|15([0-3]|[5-9])|16(6|7)|17[0-8]|18\\d|19(1|3|8|9))\\d{8}$";
    return [self evaluatePredicate:regex];
}

#pragma mark - JSON

- (id)toJSONObject {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data toJSONObject];
}

- (NSArray<NSValue *> *)rangesOfString:(NSString *)s {
    NSMutableArray<NSValue *> *rangesArray = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, self.length);
    NSRange range;
    while ((range = [self rangeOfString:s options:NSCaseInsensitiveSearch range:searchRange]).location != NSNotFound) {
        [rangesArray addObject:[NSValue valueWithRange:range]];
        searchRange = NSMakeRange(NSMaxRange(range), self.length - NSMaxRange(range));
    }
    return rangesArray;
}

- (CGSize)sizeWithFont:(UIFont *)font {
    if (!font) {
        return [self sizeWithAttributes:nil];
    }
    return [self sizeWithAttributes:@{ NSFontAttributeName : font }];
}

- (CGSize)sizeWithAttributes:(NSDictionary *)attributes {
    return [self sizeWithFitSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) attributes:attributes];
}

- (CGSize)sizeWithFitSize:(CGSize)fitSize
                        font:(UIFont *)font {
    return [self sizeWithFitSize:fitSize
                         attributes:@{ NSFontAttributeName : font }];
}

- (CGSize)sizeWithFitSize:(CGSize)fitSize
                  attributes:(NSDictionary *)attributes {
    return [self boundingRectWithSize:fitSize
                              options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                           attributes:attributes
                              context:NULL].size;
}

- (CGSize)safeSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
    CGSize inSize = CGSizeZero;
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        CGRect frame = [self boundingRectWithSize:size
                                          options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName : font}
                                          context:nil];
        inSize = CGSizeMake(ceilf(frame.size.width), ceilf(frame.size.height));
    }
    
    if (!isnormal(inSize.width)) {
        inSize.width = 0.0;
    }
    return inSize;
}

- (NSString *)avatarThumbUrl {
    return [self stringByAppendingFormat:@"?x-image-process=image/resize,m_lfit,h_%d,w_%d", 100, 100];
}

@end
