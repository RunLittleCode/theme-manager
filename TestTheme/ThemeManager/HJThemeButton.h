//
//  HJThemeButton.h
//  TestTheme
//
//  Created by liuguanchen on 16/8/18.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJThemeButton : UIButton

@property (nonatomic, copy) NSString * theme_backgroundColor;

@property (nonatomic, copy) NSString * theme_normalTitleColor;

@property (nonatomic, copy) NSString * theme_highlightTitleColor;

@property (nonatomic, copy) NSString * theme_selectedTitleColor;

@property (nonatomic, copy) NSString * theme_normalImage;

@property (nonatomic, copy) NSString * theme_highlightImage;

@property (nonatomic, copy) NSString * theme_selectedImage;

@end
