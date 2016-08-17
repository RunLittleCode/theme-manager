//
//  ThemeManager.h
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeManager : NSObject

+ (ThemeManager *)sharedInstance;

@property (nonatomic, strong) NSString * colorString;
@end
