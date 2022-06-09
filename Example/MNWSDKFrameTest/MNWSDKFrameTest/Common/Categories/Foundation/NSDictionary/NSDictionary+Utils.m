#import "NSDictionary+Utils.h"

@implementation NSDictionary (Utils)

- (NSData *)toJSONData {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:nil];
    return data;
}

- (NSString *)toJSONString {
    NSData *data = [self toJSONData];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

@end
