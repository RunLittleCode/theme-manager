//
//  HJThemeButton.m
//  TestTheme
//
//  Created by liuguanchen on 16/8/18.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import "HJThemeButton.h"

@implementation HJThemeButton

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

- (void)setTheme_normalTitleColor:(NSString *)theme_normalTitleColor {
    _theme_normalTitleColor = [theme_normalTitleColor copy];
    
    [self refreashThemeUI];
}

- (void)setTheme_highlightTitleColor:(NSString *)theme_highlightTitleColor {
    _theme_highlightTitleColor = [theme_highlightTitleColor copy];
    
    [self refreashThemeUI];
}

- (void)setTheme_selectedTitleColor:(NSString *)theme_selectedTitleColor {
    _theme_selectedTitleColor = [theme_selectedTitleColor copy];
    
    [self refreashThemeUI];
}

- (void)setTheme_normalImage:(NSString *)theme_normalImage {
    _theme_normalImage = [theme_normalImage copy];
    
    [self refreashThemeUI];
}

- (void)setTheme_highlightImage:(NSString *)theme_highlightImage {
    _theme_highlightImage = [theme_highlightImage copy];
    
    [self refreashThemeUI];
}

- (void)setTheme_selectedImage:(NSString *)theme_selectedImage {
    _theme_selectedImage = [theme_selectedImage copy];
    
    [self refreashThemeUI];
}

#pragma mark - UI method
- (void)refreashThemeUI {
    if (_theme_backgroundColor && [_theme_backgroundColor length] > 0) {
        self.backgroundColor = [[ThemeManager sharedInstance] colorForKeyPath:_theme_backgroundColor];
    }
    
    if (_theme_normalTitleColor && [_theme_normalTitleColor length] > 0) {
        [self setTitleColor:[[ThemeManager sharedInstance] colorForKeyPath:_theme_normalTitleColor] forState:UIControlStateNormal];
    }
    
    if (_theme_highlightTitleColor && [_theme_highlightTitleColor length] > 0) {
        [self setTitleColor:[[ThemeManager sharedInstance] colorForKeyPath:_theme_highlightTitleColor] forState:UIControlStateHighlighted];
    }
    
    if (_theme_selectedTitleColor && [_theme_selectedTitleColor length] > 0) {
        [self setTitleColor:[[ThemeManager sharedInstance] colorForKeyPath:_theme_highlightTitleColor] forState:UIControlStateSelected];
    }
    
    if (_theme_normalImage && [_theme_normalImage length] > 0) {
        [self setImage:[[ThemeManager sharedInstance] imageForKeyPath:_theme_normalImage] forState:UIControlStateNormal];
    }
    
    if (_theme_highlightImage && [_theme_highlightImage length] > 0) {
        [self setImage:[[ThemeManager sharedInstance] imageForKeyPath:_theme_highlightImage] forState:UIControlStateHighlighted];
    }
    
    if (_theme_selectedImage && [_theme_selectedImage length] > 0) {
        [self setImage:[[ThemeManager sharedInstance] imageForKeyPath:_theme_selectedImage] forState:UIControlStateSelected];
    }
}

#pragma mark - notification
- (void)handChangeThemeColorNotification:(NSNotification *)notification
{
    [self refreashThemeUI];
}
@end
