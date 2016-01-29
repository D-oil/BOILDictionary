//
//  ADShowWordViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/27.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADShowWordViewController.h"
#import "ADTitleView.h"

@interface ADShowWordViewController ()

@property (nonatomic,strong) ADTitleView *titleView;

@end

@implementation ADShowWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.titleView];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#define mark - getting and setting
- (ADTitleView *)titleView
{
    if (_titleView == nil)
    {
        _titleView = [[ADTitleView alloc]initWithFrame:CGRectMake(ZERO ,HEIGHT_NAVBAR + HEIGHT_STATUSBAR ,WIDTH_SCREEN ,100 )WithWord:self.word];
        
    }
    return _titleView;
}

@end
