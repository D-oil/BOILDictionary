//
//  ADRadicalViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/23.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADSearchRadicalViewController.h"
#import "AFNetworking.h"
#import "ADRadical.h"
#import "ADOneRadicalViewController.h"

#define FILENAME @"RadicalFile.plist"

@interface ADSearchRadicalViewController ()

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
    return 12;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.radicalList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"radical";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    self.radical = self.radicalList[indexPath.row];
    
    cell.textLabel.text = self.radical.bushou;
    
    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 2:
            return @"1";
            break;
            
        default:
            break;
    }
    return nil;
}

#pragma mark - NETWORK
//开发之初用于获取网络上的笔划数据 (接口已弃用)
- (void)getRadicalfile
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *str = @"http://v.juhe.cn/xhzd/bushou?dtype=json&key=543123d8aa4a7dfe947b2c9e1fbacae2";
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session POST:str parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",[responseObject valueForKey:@"result"]);
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in [responseObject valueForKey:@"result"]) {
            ADRadical *radical = [[ADRadical alloc]initWithDict:dic];
            [array addObject:radical];
        }
        self.radicalList = array;
        //归档
        [NSKeyedArchiver archiveRootObject:self.radicalList toFile:PATH_DOCUMENT_FILE(FILENAME)];
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [MBProgressHUD showMessag:@"笔画君获取失败" toView:self.view];
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
