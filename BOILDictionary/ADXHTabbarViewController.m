//
//  ADXHTabbarViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/23.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADXHTabbarViewController.h"
#import "BaseNavigationController.h"
#import "ADSearchWordViewController.h"
#import "ADSearchRadicalViewController.h"
#import "ADSearchPinyinViewController.h"

@interface ADXHTabbarViewController ()

@property (nonatomic,strong) ADSearchWordViewController *searchWordVC;

@property (nonatomic,strong) ADSearchRadicalViewController *radicalVC;

@property (nonatomic,strong) ADSearchPinyinViewController *pinyinVC;

@end

@implementation ADXHTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:DEFAULT_SEARCHBAR_COLOR];
    [self.tabBar setTintColor:DEFAULT_TBABAR_COLOR];
    
    BaseNavigationController *searchWordNavC = [[BaseNavigationController alloc] initWithRootViewController:self.searchWordVC];
    BaseNavigationController *searchRadicalNavC = [[BaseNavigationController alloc] initWithRootViewController:self.radicalVC];
    BaseNavigationController *searchPinyinNavC = [[BaseNavigationController alloc]initWithRootViewController:self.pinyinVC];
    [self setViewControllers:@[searchWordNavC,searchPinyinNavC,searchRadicalNavC]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getting and setting
- (ADSearchWordViewController *)searchWordVC
{
    if (_searchWordVC == nil) {
        _searchWordVC = [[ADSearchWordViewController alloc]initWithStyle:UITableViewStyleGrouped];
        [_searchWordVC.tabBarItem setTitle:@"按字查字典"];
        [_searchWordVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
        [_searchWordVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _searchWordVC;
}

- (ADSearchRadicalViewController *)radicalVC
{
    if (_radicalVC == nil) {
        _radicalVC = [[ADSearchRadicalViewController alloc]init];
        [_radicalVC.tabBarItem setTitle:@"按部首搜索"];
        [_radicalVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_radicalVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _radicalVC;
}

- (ADSearchPinyinViewController *)pinyinVC
{
    if (_pinyinVC == nil) {
        _pinyinVC = [[ADSearchPinyinViewController alloc]init];
        [_pinyinVC.tabBarItem setTitle:@"按拼音搜索"];
        [_pinyinVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_pinyinVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _pinyinVC;
}

@end
