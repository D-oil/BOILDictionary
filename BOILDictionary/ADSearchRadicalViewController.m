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

@property (nonatomic,strong) NSMutableArray *RadicalsubArray;

@end

@implementation ADSearchRadicalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"部首查询"];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.RadicalsubArray.count <= 7)
    {
        return 70;
    }
    else if(self.RadicalsubArray.count <= 15)
    {
        return 100;
    }
    else if(self.RadicalsubArray.count <= 23)
    {
        return 150;
    }
    else if(self.RadicalsubArray.count <= 31)
    {
        return 190;
    }
    else if(self.RadicalsubArray.count <= 39)
    {
        return 230;
    }
    else if(self.RadicalsubArray.count <= 47)
    {
        return 270;
    }
    else if(self.RadicalsubArray.count <= 55)
    {
        return 300;
    }
    return 0;
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
    
    self.RadicalsubArray = [NSMutableArray array];
    
    for (ADRadical *radical in self.radicalList) {
        if ([radical.bihua intValue] == indexPath.row+1) {
            [self.RadicalsubArray addObject:radical];
        }
    }
//    if (cell == nil) {
        cell = [[ADRadicalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId WithRadical:self.RadicalsubArray];
//    }
    
    cell.delegate = self;
    [cell setTopLineStyle:CellLineStyleFill];
    [cell setBottomLineStyle:CellLineStyleFill];
    
//    NSMutableArray *arr = [NSMutableArray array];
//    for (UIView *view in cell.contentView.subviews) {
//        if ([view isKindOfClass:[UIButton class]]) {
//            [arr addObject:view];
//        }
//    }
//    UIButton *lastBtn = [arr lastObject];
//    
//    cell.contentView.height = lastBtn.frame.origin.y + 10;
    //取消默认选中行的颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
    oneRadicalVC.searchWord = radical;
    [self.navigationController pushViewController:oneRadicalVC animated:YES];
    oneRadicalVC.title = [NSString stringWithFormat:@"部首:%@",radical];
}

#pragma mark - network
//开发之初用于获取网络上的笔划数据 (接口已弃用)
- (void)getRadicalfile
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [ADXHDictionaryNet getRadicalListWithcompleteBlock:^(ADCommunication *conn, id data) {
        if (conn.success == YES){
            
        self.radicalList = data;
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
