//
//  ADDictionaryNet.h
//  BOILDictionary
//
//  Created by andong on 16/1/27.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    GET,
    POST
}httpMethod;

@interface ADDictionaryNet : NSObject

+ (void)requestWithRequesturl:(NSString *)urlString
                   httpMethod:(httpMethod)httpMethod
                    paramters:(id)paramters
              blockCompletion: (void(^)(id data))finishBlock
                    withError:(void(^)(NSError *error))errorBlock;

@end
