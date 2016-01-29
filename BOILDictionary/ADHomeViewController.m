//
//  ADHomeViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/23.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADHomeViewController.h"
#import "ADXHTabbarViewController.h"
#import "BaseNavigationController.h"

@interface ADHomeViewController ()

@property (nonatomic,strong)UIButton *XHButton;

@property (nonatomic,strong)UIButton *CYButton;

@end

@implementation ADHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"字典";
    //新华字典按钮
    [self.view addSubview:self.XHButton];
    //成语词典按钮
    [self.view addSubview:self.CYButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonAction
- (void)pushToXHDictionary
{
    ADXHTabbarViewController *XHVC = [[ADXHTabbarViewController alloc]init];
    BaseNavigationController *rootVC = [[BaseNavigationController alloc]initWithRootViewController:XHVC];
    [UIApplication sharedApplication].keyWindow.rootViewController = rootVC;
    [self.navigationController pushViewController:XHVC animated:YES];
}

- (void)pushToCYDictionary
{

}
#pragma mark - getting and setting
- (UIButton *)XHButton
{
    if (_XHButton == nil) {
        _XHButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN *0.4, WIDTH_SCREEN *0.4)];
        [_XHButton setCenter:CGPointMake(WIDTH_SCREEN * 0.5, HEIGHT_SCREEN *0.3)];
        [_XHButton setBackgroundColor:[UIColor redColor]];
        [_XHButton addTarget:self action:@selector(pushToXHDictionary) forControlEvents:UIControlEventTouchUpInside];
    }
    return _XHButton;
}

- (UIButton *)CYButton
{
    if (_CYButton == nil) {
        self.CYButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN *0.4, WIDTH_SCREEN *0.4)];
        [self.CYButton setCenter:CGPointMake(WIDTH_SCREEN * 0.5, HEIGHT_SCREEN *0.7)];
        [self.CYButton setBackgroundColor:[UIColor redColor]];
        [_XHButton addTarget:self action:@selector(pushToCYDictionary) forControlEvents:UIControlEventTouchUpInside];
    }
    return _CYButton;
}

@end
