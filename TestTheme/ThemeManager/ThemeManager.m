//
//  ThemeManager.m
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import "ThemeManager.h"

@interface ThemeManager()
{
    NSDictionary * currentTheme;
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
        _colorString = @"#f3271b";
    }
    return self;
}

@end
