//
//  ADOneRadicalViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADOneRadicalViewController.h"
#import "ADShowWordViewController.h"
#import "ADWord.h"

@interface ADOneRadicalViewController ()
@property (nonatomic,strong)NSArray *words;

@property (nonatomic,strong)ADWord *word;
@end

@implementation ADOneRadicalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setHidesBottomBarWhenPushed:NO];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self getWords];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ADShowWordViewController *showWordVC = [[ADShowWordViewController alloc]init];
    showWordVC.word = self.words[indexPath.row];
    [self.navigationController pushViewController:showWordVC animated:YES];
}

#pragma mark -  tableView dateSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"words";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    self.word = self.words[indexPath.row];
    
    cell.textLabel.text = self.word.zi;
    
    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}


#pragma mark - NETWORK
- (void)getWords
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [ADXHDictionaryNet getSingleRadicalList:self.radical completeBlock:^(ADCommunication *conn, id data) {
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
