//
//  UIImage+ZSExtension.m
//  ZSUtils
//
//  Created by 張帥 on 2015/5/22.
//  Copyright (c) 2015年 張帥. All rights reserved.
//

#import "UIImage+ZSExtension.h"
#import "ZSUtils.h"

@implementation UIImage (ZSExtension)

+ (UIImage *)imageWithName:(NSString *)name {
    // iOS7 以后
    if ([UIDevice iOSVersion] >= 7.0) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if (image == nil) { // 没有_os7后缀的图片
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    
    // iOS6
    return [UIImage imageNamed:name];
}

/**
 *  拉伸图片的中点(.9.png)
 *
 *  @param name 图片名
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name {
    UIImage *normal = [UIImage imageWithName:name];
    return [normal resizedImage];
}

/**
 *  拉伸图片的中点(.9.png)
 */
- (UIImage *)resizedImage {
    return [self resizedImageAtLeft:0.5 top:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top {
    UIImage *image = [UIImage imageWithName:name];
    return [image resizedImageAtLeft:left top:top];
}

- (UIImage *)resizedImageAtLeft:(CGFloat)left top:(CGFloat)top {
    CGFloat t = self.size.height * top;
    CGFloat l = self.size.width * left;
    CGFloat b = self.size.height * (1-t);
    CGFloat r = self.size.width * (1-l);
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(t, l, b, r)];
    return [self stretchableImageWithLeftCapWidth:self.size.width * left topCapHeight:self.size.height * top];
}

+ (UIImage *)stretchableImageWithName:(NSString *)name {
    UIImage *normal = [UIImage imageWithName:name];
    return [normal stretchableImage];
}

- (UIImage *)stretchableImage {
    return [self stretchableImageAtLeft:0.5 top:0.5];
}

+ (UIImage *)stretchableImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top {
    UIImage *image = [UIImage imageWithName:name];
    return [image stretchableImageAtLeft:left top:top];
}

- (UIImage *)stretchableImageAtLeft:(CGFloat)left top:(CGFloat)top {
    return [self stretchableImageWithLeftCapWidth:self.size.width * left topCapHeight:self.size.height * top];
}

/**
 *  使用颜色生成1*1的图像
 *
 *  @param color UIColor
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGSize imageSize = CGSizeMake(1, 1);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg;
}

/**
 *  截取部分图像，包括旋转
 *
 *  @param rect 截取区域
 *
 *  @return 截取出来的UIImage对象
 */
- (UIImage *)imageAtRect:(CGRect)rect {
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    
    // 设置图片旋转方向
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef scale:1.0f orientation:self.imageOrientation];
    
    UIGraphicsEndImageContext();
    CGImageRelease(subImageRef);
    
    return smallImage;
}

/**
 *  生成重新调整大小的图像
 *
 *  @param reSize 新大小
 *
 *  @return UIImage
 */
- (UIImage *)imageResize:(CGSize)reSize {
    
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [self drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}

/**
 *  生成等比例缩放图片
 *
 *  @param scale 缩放比例
 *
 *  @return 缩放后的UIImage对象
 */
- (UIImage *)imageToScale:(CGFloat)scale {
    return [self imageResize:CGSizeMake(self.size.width * scale, self.size.height * scale)];
}

- (UIImage *)autoScaleWithMaxLength:(CGFloat)maxLength {
    
    CGFloat max = MAX(self.size.width, self.size.height);
    CGFloat scale = 1;
    
    if (max > maxLength) {
        scale = maxLength / max;
    }
    
    return [self imageToScale:scale];
}

/**
 *  保存UIImage对象到文件，jpg、png，通过路径文件后缀名保存格式
 *
 *  @param aPath 保存的绝对路径
 *
 *  @return 保存成功返回YES
 */
- (BOOL)writeToFile:(NSString *)aPath {
    if ((self == nil) || (aPath == nil) || ([aPath isEqualToString:@""])) return NO;
    @try
    {
        NSData *imageData = nil;
        NSString *ext = aPath.pathExtension.lowercaseString;
        if ([ext isEqualToString:@"png"]) {
            imageData = UIImagePNGRepresentation(self);
        } else {
            // the rest, we write to jpeg
            // 0. best, 1. lost. about compress.
            imageData = UIImageJPEGRepresentation(self, 1.0);
        }
        if ((imageData == nil) || ([imageData length] <= 0))
            return NO;
        [imageData writeToFile:aPath atomically:YES];
        return YES;
    }
    @catch (NSException *e)
    {
        NSLog(@"create thumbnail exception.");
    }
    return NO;
}

@end
