//
//  ADOneRadicalViewController.m
//  BOILDictionary
//
//  Created by andong on 16/1/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADOneRadicalViewController.h"
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
    
    [self getRadicalfile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NETWORK
//开发之初用于获取网络上的笔划数据 (接口已弃用)
- (void)getRadicalfile
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *urlStr = [NSString stringWithFormat:@"http://v.juhe.cn/xhzd/querybs?word=%@&dtype=&page=&pageszie=&isjijie=1&isxiangjie=1&key=543123d8aa4a7dfe947b2c9e1fbacae2",[self.radical stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",[responseObject valueForKey:@"result"]);
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in [[responseObject valueForKey:@"result"] objectForKey:@"list"]) {
            ADWord *word = [[ADWord alloc]initWithDict:dic];
            [array addObject:word];
        }
        self.words = array;
        //归档
//        [NSKeyedArchiver archiveRootObject:self.radicalList toFile:PATH_DOCUMENT_FILE(FILENAME)];
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [MBProgressHUD showMessag:@"笔画君获取失败" toView:self.view];
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
