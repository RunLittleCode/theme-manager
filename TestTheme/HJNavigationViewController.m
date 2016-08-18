//
//  HJNavigationViewController.m
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import "HJNavigationViewController.h"

@interface HJNavigationViewController ()

@end

@implementation HJNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handChangeThemeColorNotification:) name:kThemeChangeNotification object:nil];
    
    [self refreashThemeUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UI method
- (void)refreashThemeUI {
    //标题栏  标题属性设置-颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //标题栏背景色
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[[ThemeManager sharedInstance] colorForKeyPath:kThemeColorBase]]
                             forBarMetrics:UIBarMetricsDefault];
    
    //标题栏分隔线颜色
    [self.navigationBar setShadowImage:[UIImage imageWithColor:[[ThemeManager sharedInstance] colorForKeyPath:kThemeColorBase] size:CGSizeMake(10, 0.5) cornerRadius:0]];
}

#pragma mark - notification
- (void)handChangeThemeColorNotification:(NSNotification *)notification
{
    [self refreashThemeUI];
}
@end
