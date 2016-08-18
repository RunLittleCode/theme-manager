//
//  ThemeManager.m
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import "ThemeManager.h"
#import "ThemePath.h"

@interface ThemeManager()
{
    NSDictionary * currentTheme;
    ThemePath * currentThemePath;
}

@end

@implementation ThemeManager

+ (ThemeManager *)sharedInstance
{
    static ThemeManager *_instance;
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[ThemeManager alloc] init];
        }
    }
    return _instance;
}

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setThemeWithPlistName:(NSString *)plistName andThemePath:(ThemePath *)themePath {
    NSString * plistPath = [themePath plistPathByName:plistName];
    if (!plistPath && [plistPath length] == 0) {
        return;
    }
    NSDictionary * plistDic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    if (!plistDic) {
        return;
    }
    [self setThemeWithDict:plistDic andPath:themePath];
}

- (void)setThemeWithDict:(NSDictionary *)themeDic andPath:(ThemePath *)path {
    currentTheme = themeDic;
    currentThemePath = path;
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeChangeNotification object:nil];
}

- (NSString *)stringForKeyPath:(NSString *)keyPath {
    if (!keyPath || [keyPath length] == 0) {
        return nil;
    }
    NSArray<NSString *> * pathArray = [keyPath componentsSeparatedByString:@"."];
    __block NSString * value = nil;
    __block NSDictionary * currentDic = currentTheme;
    [pathArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id currentValue = currentDic[obj];
        if (currentValue) {
            if ([currentValue isKindOfClass:[NSDictionary class]]) {
                currentDic = (NSDictionary *)currentValue;
            }else if ([currentValue isKindOfClass:[NSString class]]){
                value = currentValue;
            }else if ([currentValue isKindOfClass:[NSNumber class]]){
                value = [NSString stringWithFormat:@"%@",currentValue];
            }
        }else{
            *stop = YES;
        }
    }];
    
    return value;
}


- (UIColor *)colorForKeyPath:(NSString *)keyPath {
    NSString * valueString = [self stringForKeyPath:keyPath];
    if (!valueString) {
        return nil;
    }
    UIColor * valueColor = [UIColor colorForHex:valueString];
    return valueColor;
}

- (UIImage *)imageForKeyPath:(NSString *)keyPath {
    NSString * imageName = [self stringForKeyPath:keyPath];
    if (!imageName) {
        return nil;
    }
    UIImage * imageValue;
    if (currentThemePath.type == kThemeMainBundleType) {
        imageValue = [UIImage imageNamed:imageName];
    }else if (currentThemePath.type == kThemeSandboxType){
        if (currentThemePath.baseUrl) {
            NSString * imagePath = [currentThemePath.baseUrl URLByAppendingPathComponent:imageName].path;
            UIImage * image = [UIImage imageWithContentsOfFile:imagePath];
            if (image) {
                imageValue = image;
            }
        }
    }
    
    return imageValue;
}

@end
