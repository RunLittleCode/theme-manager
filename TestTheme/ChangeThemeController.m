//
//  ChangeThemeController.m
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import "ChangeThemeController.h"
#import "ThemePath.h"


@interface ChangeThemeController ()

@end

@implementation ChangeThemeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"plist demo";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"account_share"] style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"测试" style:UIBarButtonItemStyleDone target:self action:nil];
    
    UIButton * yellowButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 80, 100, 100)];
    [yellowButton setBackgroundColor:[UIColor yellowColor]];
    [yellowButton setTitle:@"Yellow" forState:UIControlStateNormal];
    [yellowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [yellowButton addTarget:self action:@selector(blueButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yellowButton];
    
    UIButton * redButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 80, 100, 100)];
    [redButton setBackgroundColor:[UIColor redColor]];
    [redButton setTitle:@"Red" forState:UIControlStateNormal];
    [redButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [redButton addTarget:self action:@selector(redButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];
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


#pragma mark - button action
- (void)blueButtonAction {
    ThemePath * path = [[ThemePath alloc] initSandboxPathWith:@"Yellow"];
    [[ThemeManager sharedInstance] setThemeWithPlistName:@"Yellow" andThemePath:path];
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeChangeNotification object:nil];
}

- (void)redButtonAction {
    ThemePath * path = [[ThemePath alloc] initMainbundlePath];
    [[ThemeManager sharedInstance] setThemeWithPlistName:@"Red" andThemePath:path];
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeChangeNotification object:nil];
}
@end
