//
//  ChangeThemeController.m
//  TestTheme
//
//  Created by liuguanchen on 16/8/17.
//  Copyright © 2016年 liuguanchen. All rights reserved.
//

#import "ChangeThemeController.h"



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
    
    UIButton * changeButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 80, 100, 100)];
    [changeButton setTitle:@"change theme" forState:UIControlStateNormal];
    [changeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(blueButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
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
    [ThemeManager sharedInstance].colorString = @"#7ad2f9";
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeChangeNotification object:nil];
}
@end
