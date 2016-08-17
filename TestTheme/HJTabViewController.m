//
//  HJTabViewController.m
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import "HJTabViewController.h"

@interface HJTabViewController ()

@end

@implementation HJTabViewController

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
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary
                                                       dictionaryWithObjectsAndKeys: [UIColor colorForHex:[ThemeManager sharedInstance].colorString],
                                                       NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary
                                                       dictionaryWithObjectsAndKeys: [UIColor blackColor],
                                                       NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    for (UIViewController * itemController in self.viewControllers) {
        UITabBarItem * item =  itemController.tabBarItem;
        if (item) {
            item.image = [UIImage imageNamed:@"account_share"];
            item.selectedImage = [UIImage imageNamed:@"account_share"];
        }
    }
}

#pragma mark - notification
- (void)handChangeThemeColorNotification:(NSNotification *)notification
{
    [self refreashThemeUI];
}
@end
