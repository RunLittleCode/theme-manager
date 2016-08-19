//
//  HJThemeImageView.m
//  TestTheme
//
//  Created by liuguanchen on 16/8/18.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import "HJThemeImageView.h"

@implementation HJThemeImageView

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handChangeThemeColorNotification:) name:kThemeChangeNotification object:nil];
    }
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - setter
- (void)setTheme_backgroundColor:(NSString *)theme_backgroundColor {
    _theme_backgroundColor = [theme_backgroundColor copy];
    
    [self refreashThemeUI];
}

- (void)setTheme_image:(NSString *)theme_image {
    _theme_image = [theme_image copy];
    
    [self refreashThemeUI];
}

#pragma mark - UI method
- (void)refreashThemeUI {
    if (_theme_backgroundColor && [_theme_backgroundColor length] > 0) {
        self.backgroundColor = [[ThemeManager sharedInstance] colorForKeyPath:_theme_backgroundColor];
    }
    
    if (_theme_image && [_theme_image length] > 0) {
        self.image = [[ThemeManager sharedInstance] imageForKeyPath:_theme_image];
    }
}

#pragma mark - notification
- (void)handChangeThemeColorNotification:(NSNotification *)notification
{
    [self refreashThemeUI];
}

@end
