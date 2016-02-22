//
//  ADXHDictionaryNet.m
//  BOILDictionary
//
//  Created by andong on 16/1/28.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADXHDictionaryNet.h"
#import "NSString+URL.h"
#import "ADRadical.h"
#import "ADWord.h"
#import "ADPinyin.h"

@implementation ADXHDictionaryNet
//获取部首列表接口
+ (void)getRadicalListWithcompleteBlock:(void(^)(ADCommunication *conn,id data))block
{
    __block ADCommunication *conn = [[ADCommunication alloc] init];
    
    NSString *urlStr = [NSString urlStringWithRequestID:REQUEST_GET_XINHUA_RADICALLIST dataType:JSON];
    
    [ADDictionaryNet requestWithRequesturl:urlStr httpMethod:GET paramters:nil blockCompletion:^(id data) {
        
        conn.resultCode = (NSInteger)[[data objectForKey:@"error_code"] longValue];
        
        if (conn.resultCode != 0) {
            conn.success = NO;
            conn.reason = [data objectForKey:@"reason"];
            
            block(conn,nil);
        }
        
        else
        {
            conn.success = YES;
            conn.reason = [data objectForKey:@"reason"];
            
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary *dic in [data valueForKey:@"result"]) {
                ADRadical *radical = [[ADRadical alloc]initWithDict:dic];
                [array addObject:radical];
            }
            block(conn,[NSArray arrayWithArray:array]);
        }
        
    } withError:^(NSError *error) {
        conn.success = NO;
        conn.reason = [error description];
        
        block(conn,nil);
    }];
}
//获取拼音列表
+ (void)getPinyinListWithcompleteBlock:(void(^)(ADCommunication *conn,id data))block
{
    __block ADCommunication *conn = [[ADCommunication alloc] init];
    
    NSString *urlStr = [NSString urlStringWithRequestID:REQUEST_GET_XINHUA_PINYIN dataType:JSON];
    
    [ADDictionaryNet requestWithRequesturl:urlStr httpMethod:GET paramters:nil blockCompletion:^(id data) {
        
        conn.resultCode = (NSInteger)[[data objectForKey:@"error_code"] longValue];
        
        if (conn.resultCode != 0) {
            conn.success = NO;
            conn.reason = [data objectForKey:@"reason"];
            
            block(conn,nil);
        }
        
        else
        {
            conn.success = YES;
            conn.reason = [data objectForKey:@"reason"];
            
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary *dic in [data valueForKey:@"result"]) {
                ADPinyin *pinyin = [[ADPinyin alloc]initWithDict:dic];
                [array addObject:pinyin];
            }
            block(conn,[NSArray arrayWithArray:array]);
        }
        
    } withError:^(NSError *error) {
        conn.success = NO;
        conn.reason = [error description];
        
        block(conn,nil);
    }];
}

//获取部首对应的汉字列表
+ (void)getSingleRadicalList:(NSString *)radical completeBlock:(void(^)(ADCommunication *conn,id data))block
{
    __block ADCommunication *conn = [[ADCommunication alloc] init];
    
    NSString *urlStr = [NSString urlStringWithRequestID:REQUEST_GET_XINHUA_SINGLERADICALLIST dataType:JSON];
    
    urlStr = [urlStr stringByAppendingFormat:@"?word=%@&dtype=&page=&pageszie=50&isjijie=1&isxiangjie=1&key=543123d8aa4a7dfe947b2c9e1fbacae2",[radical stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [ADDictionaryNet requestWithRequesturl:urlStr httpMethod:GET paramters:nil blockCompletion:^(id data) {

        conn.resultCode = (NSInteger)[[data objectForKey:@"error_code"] longValue];
        
        if (conn.resultCode != 0) {
            conn.success = NO;
            conn.reason = [data objectForKey:@"reason"];
            
            block(conn,nil);
        }
        
        else
        {
            conn.success = YES;
            conn.reason = [data objectForKey:@"reason"];
            
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary *dic in [[data valueForKey:@"result"] objectForKey:@"list"]) {
                ADWord *word = [[ADWord alloc]initWithDict:dic];
                [array addObject:word];
            }
            block(conn,[NSArray arrayWithArray:array]);
        }
        
    } withError:^(NSError *error) {
        conn.success = NO;
        conn.reason = [error description];
        
        block(conn,nil);
    }];
}
//获取汉字对应的信息
+ (void)getWordInfo:(NSString *)word completeBlock:(void(^)(ADCommunication *conn,id data))block
{
    __block ADCommunication *conn = [[ADCommunication alloc] init];
    
    NSString *urlStr = [NSString urlStringWithRequestID:REQUEST_GET_XINHUA_WORDINFO dataType:JSON];
    
     urlStr = [urlStr stringByAppendingFormat:@"?word=%@&dtype=&key=543123d8aa4a7dfe947b2c9e1fbacae2",[word stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [ADDictionaryNet requestWithRequesturl:urlStr httpMethod:GET paramters:nil blockCompletion:^(id data) {
        
        conn.resultCode = (NSInteger)[[data objectForKey:@"error_code"] longValue];
        
        if (conn.resultCode != 0) {
            conn.success = NO;
            conn.reason = [data objectForKey:@"reason"];
            
            block(conn,nil);
        }
        
        else
        {
            conn.success = YES;
            conn.reason = [data objectForKey:@"reason"];
            
            block(conn,[[ADWord alloc]initWithDict:[data objectForKey:@"result"]]);
        }
        
    } withError:^(NSError *error) {
        conn.success = NO;
        conn.reason = [error description];
        
        block(conn,nil);
    }];
}

//获取拼音对应的汉字列表
+ (void)getSinglepinyinList:(NSString *)pinyin completeBlock:(void(^)(ADCommunication *conn,id data))block
{
    __block ADCommunication *conn = [[ADCommunication alloc] init];
    
    NSString *urlStr = [NSString urlStringWithRequestID:REQUEST_GET_XINHUA_SINGLEPINYIN dataType:JSON];
    
    urlStr = [urlStr stringByAppendingFormat:@"?word=%@&dtype=son&page=1&pageszie=50&isjijie=1&isxiangjie=1&key=543123d8aa4a7dfe947b2c9e1fbacae2",pinyin];
    
    [ADDictionaryNet requestWithRequesturl:urlStr httpMethod:GET paramters:nil blockCompletion:^(id data) {
        
        conn.resultCode = (NSInteger)[[data objectForKey:@"error_code"] longValue];
        
        if (conn.resultCode != 0) {
            conn.success = NO;
            conn.reason = [data objectForKey:@"reason"];
            
            block(conn,nil);
        }
        
        else
        {
            conn.success = YES;
            conn.reason = [data objectForKey:@"reason"];
            
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary *dic in [[data valueForKey:@"result"] objectForKey:@"list"]) {
                ADWord *word = [[ADWord alloc]initWithDict:dic];
                [array addObject:word];
            }
            block(conn,[NSArray arrayWithArray:array]);
        }
        
    } withError:^(NSError *error) {
        conn.success = NO;
        conn.reason = [error description];
        
        block(conn,nil);
    }];
}

//查成语
+ (void)getChengyu:(NSString *)chengyu completeBlock:(void(^)(ADCommunication *conn,id data))block
{
    __block ADCommunication *conn = [[ADCommunication alloc] init];
    
    NSString *urlStr = [NSString urlStringWithRequestID:REQUEST_GET_CHENGYU_SINGLECHENGYU dataType:JSON];
    
    urlStr = [urlStr stringByAppendingFormat:@"?word=%@&dtype=&key=532ba26b6b58cfe3daa4c8aa473ead53",[chengyu stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [ADDictionaryNet requestWithRequesturl:urlStr httpMethod:GET paramters:nil blockCompletion:^(id data) {
        
        conn.resultCode = (NSInteger)[[data objectForKey:@"error_code"] longValue];
        
        if (conn.resultCode != 0) {
            conn.success = NO;
            conn.reason = [data objectForKey:@"reason"];
            
            block(conn,nil);
        }
        
        else
        {
            conn.success = YES;
            conn.reason = [data objectForKey:@"reason"];
            
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary *dic in [[data valueForKey:@"result"] objectForKey:@"list"]) {
                ADWord *word = [[ADWord alloc]initWithDict:dic];
                [array addObject:word];
            }
            block(conn,[NSArray arrayWithArray:array]);
        }
        
    } withError:^(NSError *error) {
        conn.success = NO;
        conn.reason = [error description];
        
        block(conn,nil);
    }];
}
@end
