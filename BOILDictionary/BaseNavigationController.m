//
//  BaseNavigationController.m
//  BOILDictionary
//
//  Created by andong on 16/1/23.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationBar setBackgroundColor:DEFAULT_NAVBAR_COLOR];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setBarTintColor:DEFAULT_NAVBAR_COLOR];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
