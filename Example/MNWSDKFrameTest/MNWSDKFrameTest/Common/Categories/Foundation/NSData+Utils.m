#import "NSData+Utils.h"

@implementation NSData (Utils)

#pragma mark - JSON

- (id)toJSONObject {
    id obj = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingAllowFragments error:nil];
    return obj;
}

#pragma mark - 加密解密

- (NSData *)base64Encoded {
    NSData *data = [self base64EncodedDataWithOptions:0];
    return data;
}

- (NSData *)base64Decoded {
    NSData *data = [[NSData alloc] initWithBase64EncodedData:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return data;
}

@end
