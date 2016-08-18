//
//  ThemeManager.h
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kThemeColorBase @"Global.backgroundColor"
#define kThemeImageSelectTab @"SelectThemeCell.iconImage"


@class ThemePath;

@interface ThemeManager : NSObject

+ (ThemeManager *)sharedInstance;

- (void)setThemeWithPlistName:(NSString *)plistName andThemePath:(ThemePath *)themePath;

- (NSString *)stringForKeyPath:(NSString *)keyPath;

- (UIColor *)colorForKeyPath:(NSString *)keyPath;

- (UIImage *)imageForKeyPath:(NSString *)keyPath;
@end
