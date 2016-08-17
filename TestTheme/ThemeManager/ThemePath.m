//
//  ThemePath.m
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import "ThemePath.h"

@implementation ThemePath

- (NSString *)plistPathByName:(NSString *)name {
    if (_type == kThemeMainBundleType) {
        NSString * path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
        return path;
    }else if (_type == kThemeSandboxType) {
        return [NSString stringWithFormat:@"%@.plist",name];
    }else{
        return nil;
    }
}
@end
