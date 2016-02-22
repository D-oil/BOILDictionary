//
//  ADShowWordViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/27.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADShowWordViewController.h"
#import "ADTitleView.h"
#import "ADWordDetail.h"
#import "ADWordAboutView.h"

@interface ADShowWordViewController () <UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) ADTitleView *titleView;

@property (nonatomic,strong) ADWordAboutView *jianjieView;

@property (nonatomic,strong) ADWordAboutView *xiangxiView;

@property (nonatomic,strong) ADWordDetail *detailView;


@end

@implementation ADShowWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setHidesBottomBarWhenPushed:YES];
    
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.titleView];
    [self.scrollView addSubview:self.jianjieView];
    [self.scrollView addSubview:self.xiangxiView];
    self.scrollView.contentSize = CGSizeMake(WIDTH_SCREEN, self.xiangxiView.bottom);
    //    [self.view addSubview:self.detailView];
}

#define mark - custom


//createLine
- (UIView *)creatLine
{
    UIView *subLine = [[UIView alloc]initWithFrame:CGRectMake(ZERO, 100-1, WIDTH_SCREEN, 1)];
    subLine.backgroundColor = DEFAULT_NAVBAR_COLOR;
    return subLine;
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
        [_titleView addSubview:[self creatLine]];
    }
    return _titleView;
}

- (ADWordDetail *)detailView
{
    if (_detailView == nil)
    {
        _detailView = [[ADWordDetail alloc]initWithFrame:CGRectMake(ZERO, HEIGHT_NAVBAR + HEIGHT_STATUSBAR + 100,WIDTH_SCREEN , 200)];
        _detailView.backgroundColor = [UIColor whiteColor];
    }
    return _detailView;
}

- (ADWordAboutView *)jianjieView
{
    if (_jianjieView == nil) {
        _jianjieView = [[ADWordAboutView alloc]initWithFrame:CGRectMake(ZERO, self.titleView.height, WIDTH_SCREEN, self.word.jijie.count * 25 + 20 + 60)WithWord:self.word.jijie];
        _jianjieView.backgroundColor = [UIColor whiteColor];
    }
    return _jianjieView;
}

- (ADWordAboutView *)xiangxiView
{
    if (_xiangxiView == nil) {
        _xiangxiView = [[ADWordAboutView alloc]initWithFrame:CGRectMake(ZERO, self.jianjieView.bottom, WIDTH_SCREEN, self.word.xiangjie.count * 25 + 20 + 60)WithWord:self.word.xiangjie];
        _xiangxiView.backgroundColor = [UIColor whiteColor];
    }
    return _xiangxiView;
}

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.scrollEnabled = YES;


    }
    return _scrollView;
}
@end
