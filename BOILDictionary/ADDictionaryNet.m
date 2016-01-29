//
//  ADDictionaryNet.m
//  BOILDictionary
//
//  Created by andong on 16/1/27.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADDictionaryNet.h"
#import "AFNetworking.h"

@implementation ADDictionaryNet

+ (void)requestWithRequesturl:(NSString *)urlString
                   httpMethod:(httpMethod)httpMethod
                    paramters:(id)paramters
              blockCompletion: (void(^)(id data))finishBlock
                    withError:(void(^)(NSError *error))errorBlock
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    if (httpMethod == GET) {
        [session GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            finishBlock(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            errorBlock(error);
        }];
 
    }

    if (httpMethod == POST) {
        [session POST:urlString parameters:paramters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            finishBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            errorBlock(error);
        }];
        
    }
}

@end
