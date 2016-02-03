//
//  ADRadicalViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/23.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADSearchRadicalViewController.h"
#import "ADRadical.h"
#import "ADOneRadicalViewController.h"
#import "ADRadicalCell.h"

#define FILENAME @"RadicalFile.plist"

@interface ADSearchRadicalViewController () <ADRadicalCellDelegate>

@property (nonatomic,strong) NSArray *radicalList;

@property (nonatomic,strong) ADRadical *radical;

@end

@implementation ADSearchRadicalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setHidesBottomBarWhenPushed:NO];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //解档笔画数据
    NSString *path = [[NSBundle mainBundle]pathForResource:@"RadicalFile.plist" ofType:nil];
    
    self.radicalList = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -  tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ADOneRadicalViewController *oneRadicalVC = [[ADOneRadicalViewController alloc]init];
    oneRadicalVC.radical = cell.textLabel.text;
    [self.navigationController pushViewController:oneRadicalVC animated:YES];
}

#pragma mark -  tableView dateSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"radical";
    
    ADRadicalCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    NSMutableArray *RadicalsubArray = [NSMutableArray array];
    
    for (ADRadical *radical in self.radicalList) {
        if ([radical.bihua intValue] == indexPath.row+1) {
            [RadicalsubArray addObject:radical];
        }
    }
//    if (cell == nil) {
        cell = [[ADRadicalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId WithRadical:RadicalsubArray];
//    }
    
    cell.delegate = self;
    [cell setTopLineStyle:CellLineStyleFill];
    [cell setBottomLineStyle:CellLineStyleFill];

    
    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}
#pragma mark - ADRadicalCellDelegate
- (void)radicalButton:(UIButton *)radicalBtn WithRaducal:(NSString *)radical
{

    ADOneRadicalViewController *oneRadicalVC = [[ADOneRadicalViewController alloc]init];
    oneRadicalVC.radical = radical;
    [self.navigationController pushViewController:oneRadicalVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    ADRadicalCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    return 300;
}

#pragma mark - network
//开发之初用于获取网络上的笔划数据 (接口已弃用)
- (void)getRadicalfile
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [ADXHDictionaryNet getRadicalListWithcompleteBlock:^(ADCommunication *conn, id data) {
        if (conn.success == YES) {
        //归档
        [NSKeyedArchiver archiveRootObject:self.radicalList toFile:PATH_DOCUMENT_FILE(FILENAME)];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
        else
        {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [MBProgressHUD showMessag:@"笔画君获取失败" toView:self.view];
        }
    }];
}

#pragma mark - getting and setting

- (NSArray *)radicalList
{
    if (_radicalList == nil)
    {
        _radicalList = [NSArray array];
    }
    return _radicalList;
}

@end
