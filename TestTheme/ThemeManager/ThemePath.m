//
//  ThemePath.m
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import "ThemePath.h"

@interface ThemePath()
{
    NSString * currentThemeName;
    
}

@end

@implementation ThemePath

- (instancetype)initMainbundlePath {
    self = [super init];
    if (self) {
        _type = kThemeMainBundleType;
    }
    return self;
}

- (instancetype)initSandboxPathWith:(NSString *)themeName {
    self = [super init];
    if (self) {
        _type = kThemeSandboxType;
        currentThemeName = [themeName copy];
        NSURL * libraryUrl = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0];
        _baseUrl = [libraryUrl URLByAppendingPathComponent:[NSString stringWithFormat:@"Theme/%@/",currentThemeName]];
    }
    return self;
}

- (NSString *)plistPathByName:(NSString *)name {
    if (_type == kThemeMainBundleType) {
        NSString * path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
        return path;
    }else if (_type == kThemeSandboxType) {
        NSURL * pathurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@.plist",name] relativeToURL:_baseUrl];
        return pathurl.path;
    }else{
        return nil;
    }
}
@end
