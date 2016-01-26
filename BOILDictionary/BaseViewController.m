//
//  CommonViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/22.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void) viewDidLoad
{
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    
    [self setHidesBottomBarWhenPushed:YES];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

@end
