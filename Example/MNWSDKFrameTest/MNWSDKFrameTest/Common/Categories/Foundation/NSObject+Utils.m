#import "NSObject+Utils.h"

@implementation NSObject (Utils)

- (BOOL)isNumber {
    return [self isKindOfClass:[NSNumber class]];
}

- (BOOL)isString {
    return [self isKindOfClass:[NSString class]];
}

- (BOOL)isValidString {
    return [self isString] && ((NSString *)self).length > 0;
}

- (BOOL)isArray {
    return [self isKindOfClass:[NSArray class]];
}

- (BOOL)isValidArray {
    return [self isArray] && ((NSArray *)self).count > 0;
}

- (BOOL)isDictionary {
    return [self isKindOfClass:[NSDictionary class]];
}

- (BOOL)isValidDictionary {
    return [self isDictionary] && ((NSDictionary *)self).count > 0;
}

- (BOOL)isSet {
    return [self isKindOfClass:[NSSet class]];
}

- (BOOL)isValidSet {
    return [self isSet] && ((NSSet *)self).count > 0;
}

@end
