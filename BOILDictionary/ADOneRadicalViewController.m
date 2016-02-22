//
//  ADOneRadicalViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADOneRadicalViewController.h"
#import "ADShowWordViewController.h"
#import "ADShowwordCell.h"
#import "ADWord.h"

@interface ADOneRadicalViewController ()

@property (nonatomic,strong)NSArray *words;

@property (nonatomic,strong)ADWord *word;

@end

@implementation ADOneRadicalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self setHidesBottomBarWhenPushed:NO];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //如果是pinyin就调用拼音接口否则调用笔画接口
    if ([self.type isEqualToString:@"pinyin"])
    {
        [self getWordsWithPinyin];
    }else
    {
        [self getWordsWithRadical];
    }
    



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ADShowWordViewController *showWordVC = [[ADShowWordViewController alloc]init];
    self.word = self.words[indexPath.row];
    showWordVC.word = self.words[indexPath.row];
    [self.navigationController pushViewController:showWordVC animated:YES];
    showWordVC.title = self.word.zi;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

#pragma mark -  tableView dateSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"words";
    
    ADShowwordCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
//    if (cell == nil) {
        cell = [[ADShowwordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId WithWord:self.words[indexPath.row]];
//    }
    [cell setTopLineStyle:CellLineStyleFill];
    [cell setBottomLineStyle:CellLineStyleFill];

    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


#pragma mark - NETWORK
- (void)getWordsWithRadical
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [ADXHDictionaryNet getSingleRadicalList:self.searchWord completeBlock:^(ADCommunication *conn, id data) {
        if (conn.success == YES) {
            
            self.words = data;
            
            [self.tableView reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
        else
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [MBProgressHUD showError:@"获取失败" toView:self.view];
        }
        
    }];
}

- (void)getWordsWithPinyin
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [ADXHDictionaryNet getSinglepinyinList:self.searchWord completeBlock:^(ADCommunication *conn, id data) {
        if (conn.success == YES) {
            
            self.words = data;
            
            [self.tableView reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
        else
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [MBProgressHUD showError:@"获取失败" toView:self.view];
        }
        
    }];
}

#pragma mark - getting and setting
- (NSArray *)words
{
    if (_words == nil) {
        _words = [NSArray array];
    }
    return _words;
}

@end
