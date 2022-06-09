//
//  NSMutableDictionary+Safe.m
//  Oasis
//
//  Created by mini1 on 2021/1/12.
//

#import "NSMutableDictionary+Safe.h"

@implementation NSMutableDictionary (Safe)
- (void)safe_setObject:(id)object forKey:(id<NSCopying>)key
{
//    NSParameterAssert(object && key);
    if(!object || !key){
        return;
    }
    [self setObject:object forKey:key];
}
- (void)mr_safeSetValue:(id)obj key:(id<NSCopying>)key {
    [self safe_setObject:obj forKey:key];
}

- (void)safe_removeObjectForKey:(NSString*)key
{
//    NSParameterAssert(key.length > 0);
    if (!key || key.length == 0) {
        return;
    }
    [self removeObjectForKey:key];
}
@end
