//
//  ThemePath.h
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ThemePathType) {
    kThemeMainBundleType = 1,
    kThemeSandboxType = 2,
};

@interface ThemePath : NSObject

@property (nonatomic, assign) ThemePathType type;
@property (nonatomic, strong) NSURL * baseUrl;

- (instancetype)initMainbundlePath;

- (instancetype)initSandboxPathWith:(NSString *)themeName;

- (NSString *)plistPathByName:(NSString *)name;

@end
