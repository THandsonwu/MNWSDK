#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Utils)

/**
 创建纯色、指定尺寸的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 创建纯色、1x1像素的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 修复图片方向问题
 */
- (UIImage *)imageAfterFixedOrientation;

/**
 创建线性渐变图片
 */
+ (UIImage *)imageWithGradientHorizontal:(BOOL)horizontal
                                    from:(UIColor *)fromColor
                                      to:(UIColor *)toColor
                                   width:(CGFloat)width
                                  height:(CGFloat)height;

/**
 圆角矩形裁剪
 */
- (UIImage *)imageWithRoundedCorner:(CGFloat)cornerRadius;

/**
 图片模糊效果

 @param image 原图
 @return 模糊图
 */
+ (UIImage *)blurImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
