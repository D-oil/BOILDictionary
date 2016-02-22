//
//  ADSearchPinyinViewController.m
//  BOILDictionary
//
//  Created by andong on 16/2/18.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADSearchPinyinViewController.h"
#import "ADOneRadicalViewController.h"
#import "ADPinyin.h"
#import "ADOneRadicalViewController.h"
#import "ADPYindex.h"

@interface ADSearchPinyinViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray *pinyinList;

@property (nonatomic,strong)ADPinyin *pinyinInfo;

@property (nonatomic,strong)NSArray *arrWithIndex;

@property (nonatomic,strong)NSMutableArray *cellInfo;

@property (nonatomic,strong)ADPYindex *pyIndexforCell;

@end

#define FILENAME @"PinyinFile.plist"



@implementation ADSearchPinyinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrWithIndex = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D",@"E",
                             @"F", @"G", @"H", @"I",@"J",
                             @"K", @"L", @"M", @"N",@"O",
                             @"P", @"Q", @"R", @"S",@"T",
                             @"W", @"X",@"Y",@"Z", nil];
    
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"拼音查询"];
    [self setHidesBottomBarWhenPushed:NO];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //解档拼音数据
    NSString *path = [[NSBundle mainBundle]pathForResource:@"PinyinFile.plist" ofType:nil];
    
    self.pinyinList = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    //转换模型
    [self pyInfoChange];

}
//改变拼音的格式，使得可以准确的放入cell中
- (void)pyInfoChange
{
    for(int i = 0 ;i< 24; i++){
        
        ADPYindex *pyIndex = [[ADPYindex alloc]init];
        
        NSMutableArray *arr = [NSMutableArray array];
        for (id obj in self.pinyinList) {
            self.pinyinInfo = obj;
            if ([self.pinyinInfo.key isEqualToString:self.arrWithIndex[i]]) {
                [arr addObject:self.pinyinInfo];
            }
            
        }
        pyIndex.title = self.arrWithIndex[i];
        pyIndex.arrayPy = arr;
        [self.cellInfo addObject:pyIndex];
    }
}


//废弃
- (void)getPinyinList
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [ADXHDictionaryNet getPinyinListWithcompleteBlock:^(ADCommunication *conn, id data) {
        if (conn.success == YES) {
            //归档
            self.pinyinList = data;
            
            [NSKeyedArchiver archiveRootObject:self.pinyinList toFile:PATH_DOCUMENT_FILE(FILENAME)];
            ADDICLog(@"%@",PATH_DOCUMENT_FILE(FILENAME));
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
        else
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [MBProgressHUD showMessag:@"拼音获取失败" toView:self.view];
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

#pragma mark - tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    ADOneRadicalViewController *showWordVC = [[ADOneRadicalViewController alloc]init];
    showWordVC.type = @"pinyin";
    showWordVC.searchWord = cell.textLabel.text;
    showWordVC.title = [NSString stringWithFormat:@"拼音:%@",cell.textLabel.text];
    [self.navigationController pushViewController:showWordVC animated:YES];
}

#pragma mark - tableview dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 24;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num = 0;
    for (id obj in self.pinyinList) {
        self.pinyinInfo = obj;
        if ([self.pinyinInfo.key isEqualToString:self.arrWithIndex[section]]) {
            num++;
        }
    }
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"pinyin";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    

    self.pyIndexforCell = self.cellInfo[indexPath.section];
    self.pinyinInfo = self.pyIndexforCell.arrayPy[indexPath.row];
    cell.textLabel.text = self.pinyinInfo.pinyin;

    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.arrWithIndex[section];
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.arrWithIndex;
}

#pragma mark - getting and setting

- (NSArray *)pinyinList
{
    if (_pinyinList == nil)
    {
        _pinyinList = [NSArray array];
    }
    return _pinyinList;
}

- (NSMutableArray *)cellInfo
{
    if (_cellInfo == nil)
    {
        _cellInfo = [NSMutableArray array];
    }
    return _cellInfo;
}
- (ADPYindex *)pyIndexforCell
{
    if (_pyIndexforCell == nil) {
        _pyIndexforCell = [[ADPYindex alloc]init];
    }
    return _pyIndexforCell;
}
@end
