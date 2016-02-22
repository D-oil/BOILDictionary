//
//  ADSearchWordViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/23.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADSearchWordViewController.h"
#import "ADHomeViewController.h"
#import "ADShowWordViewController.h"
#import "ADShowwordCell.h"
#import "ADTitleView.h"
#import "ADWord.h"

@interface ADSearchWordViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) NSMutableArray *WordList;

@property (nonatomic, strong) ADWord *word;

@property (nonatomic, strong) NSMutableArray *printWordList;

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
    [self.navigationItem setTitle:@"新华字典"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hideKeyboard];
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

//检查字符串中的中文
-(BOOL)IsChinese:(NSString *)str {
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i];
        
        if( a >= 0x4e00 && a <= 0x9fff)
        {
        return YES;
        }
    }
    return NO;
}

-(BOOL)isRepeat:(NSString *)wordstr
{
    BOOL repeat = false;
    for (NSString *str in self.printWordList) {
        if ([wordstr isEqualToString:str]) {
            repeat = YES;
        }
        else
        {
            repeat = NO;
        }
        
    }
    return repeat;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{  
    [self.WordList removeAllObjects];
    
    [self hideKeyboard];
    //去除首尾的空格
    NSString *str = [searchBar.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //去除中间的空格
    NSArray *components = [str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    components = [components filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
    str = [components componentsJoinedByString:@""];
    
    NSRange range;
    range.length = 1;
    //遍历字符串
    for(int i =0; i < str.length; i++)
    {
        range.location = i;

        if ([self IsChinese:[str substringWithRange:range]])
        {

            if ([self isRepeat:[str substringWithRange:range]] == YES)
            {
                
            }
            else
            {
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                
                [ADXHDictionaryNet getWordInfo:[str substringWithRange:range] completeBlock:^(ADCommunication *conn, id data) {
                    
                    self.word = data;
                    if(self.word != nil){
                        [self.WordList addObject:self.word];
                        [self.tableView reloadData];
                    }
                    
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    
                }];
            }
             [self.printWordList addObject:[str substringWithRange:range]];
            
        }
      
    }
}
#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.word = self.WordList[indexPath.row];
    ADShowWordViewController *showWordVC = [[ADShowWordViewController alloc]init];
    showWordVC.word = self.word;
    showWordVC.title = self.word.zi;
    [self.navigationController pushViewController:showWordVC animated:YES];
}

#pragma mark - TableViewDatesource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.WordList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseId = @"word";
    
    ADShowwordCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
//    if (cell == nil) {
        cell = [[ADShowwordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId WithWord:self.WordList[indexPath.row]];
//    }
    

    [cell setTopLineStyle:CellLineStyleFill];
    [cell setBottomLineStyle:CellLineStyleFill];
    
    //取消默认选中行的颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
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

- (NSMutableArray *)WordList
{
    if (_WordList == nil) {
        _WordList = [NSMutableArray array];
    }
    return _WordList;
}

- (NSMutableArray *)printWordList
{
    if (_printWordList == nil) {
        _printWordList = [NSMutableArray array];
    }
    return _printWordList;
}

@end
