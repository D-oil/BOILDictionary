//
//  ADSearchWordViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/23.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADSearchWordViewController.h"

@interface ADSearchWordViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation ADSearchWordViewController

#pragma mark - LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    
}

-(void)viewWillDisappear:(BOOL)animated{
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"消息"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    [self.tableView addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - custom
- (void)hideKeyboard
{
    [self.searchBar resignFirstResponder];
}


#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
}


#pragma mark - TableViewDatesource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"word";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.searchBar;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return HEIGHT_SEARCHBAR;
}

#pragma mark - getting and setting
- (UISearchBar *)searchBar
{
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(ZERO, ZERO, WIDTH_SCREEN, HEIGHT_SEARCHBAR)];
        [_searchBar setSearchBarStyle:UISearchBarStyleMinimal];
        [_searchBar showsCancelButton];
        [_searchBar setTintColor:DEFAULT_TBABAR_COLOR];
        _searchBar.delegate =self;
    }
    return _searchBar;
}
@end
