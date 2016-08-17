//
//  UIImage+Color.h
//  SystemExpert
//
//  Created by Can Chen on 14-4-3.
//  Copyright (c) 2014年 Qihoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size
               cornerRadius:(CGFloat)cornerRadius;

- (UIImage *)accelerateBlurWithBoxSize:(int)boxSize;

@end
