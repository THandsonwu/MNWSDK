//
//  NSMutableDictionary+Safe.h
//  Oasis
//
//  Created by mini1 on 2021/1/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (Safe)
/**
 * 防止key或者objec为nil，引起的crash。
 * 预防编码中忘记检测为nil，引起crash。
 */
- (void)safe_setObject:(id)object forKey:(id<NSCopying>)key;

- (void)mr_safeSetValue:(id)obj key:(id<NSCopying>)key;

- (void)safe_removeObjectForKey:(NSString*)key;
@end

NS_ASSUME_NONNULL_END
