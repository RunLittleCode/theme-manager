//
//  UIImage+Color.m
//  SystemExpert
//
//  Created by Can Chen on 14-4-3.
//  Copyright (c) 2014年 Qihoo. All rights reserved.
//

#import "UIImage+Color.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (Color)


+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
//    UIGraphicsBeginImageContext(rect.size);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size
               cornerRadius:(CGFloat)cornerRadius
{
    CGRect rect = (CGRect){CGPointZero, size};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:rect
                                                      cornerRadius:cornerRadius];
    CGContextAddPath(context, bezier.CGPath);
    CGContextClosePath(context);
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)accelerateBlurWithBoxSize:(int)boxSize;
{
//    NSInteger boxSize = (NSInteger)(10 * 5);
    boxSize = boxSize - (boxSize % 2) + 1;  // 保证是奇数
    UIImage *retImage = nil;
    CGImageRef img = self.CGImage;
    
    vImage_Buffer inBuffer, outBuffer, rgbOutBuffer;
    vImage_Error error;
    
    void *pixelBuffer, *convertBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    assert(inBitmapData);
    convertBuffer = malloc( CGImageGetBytesPerRow(img) * CGImageGetHeight(img) );
    pixelBuffer = malloc( CGImageGetBytesPerRow(img) * CGImageGetHeight(img) );
    if (convertBuffer && pixelBuffer)
    {
        rgbOutBuffer.width = CGImageGetWidth(img);
        rgbOutBuffer.height = CGImageGetHeight(img);
        rgbOutBuffer.rowBytes = CGImageGetBytesPerRow(img);
        rgbOutBuffer.data = convertBuffer;
        
        inBuffer.width = CGImageGetWidth(img);
        inBuffer.height = CGImageGetHeight(img);
        inBuffer.rowBytes = CGImageGetBytesPerRow(img);
        inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);

        outBuffer.data = pixelBuffer;
        outBuffer.width = CGImageGetWidth(img);
        outBuffer.height = CGImageGetHeight(img);
        outBuffer.rowBytes = CGImageGetBytesPerRow(img);
        
        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        if (error) {
            NSLog(@"error from convolution %ld", error);
        }
        const uint8_t mask[] = {2, 1, 0, 3};
        
        vImagePermuteChannels_ARGB8888(&outBuffer, &rgbOutBuffer, mask, kvImageNoFlags);
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef ctx = CGBitmapContextCreate(rgbOutBuffer.data,
                                                 rgbOutBuffer.width,
                                                 rgbOutBuffer.height,
                                                 8,
                                                 rgbOutBuffer.rowBytes,
                                                 colorSpace,
                                                 (kCGBitmapAlphaInfoMask & kCGImageAlphaNoneSkipLast));
        CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
        retImage = [UIImage imageWithCGImage:imageRef];
        
        //clean up
        CGImageRelease(imageRef);
        CGContextRelease(ctx);
        CGColorSpaceRelease(colorSpace);
    }
    free(pixelBuffer);
    free(convertBuffer);
    CFRelease(inBitmapData);
    
    
    return (retImage);
}
@end
