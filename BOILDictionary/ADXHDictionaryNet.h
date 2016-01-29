//
//  ADXHDictionaryNet.h
//  BOILDictionary
//
//  Created by andong on 16/1/28.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADDictionaryNet.h"
#import "ADCommunication.h"
@interface ADXHDictionaryNet : NSObject

//获取部首列表接口
+ (void)getRadicalListWithcompleteBlock:(void(^)(ADCommunication *conn,id data))block;
//获取部首对应的汉字列表
+ (void)getSingleRadicalList:(NSString *)radical completeBlock:(void(^)(ADCommunication *conn,id data))block;
//获取汉字对应的信息
+ (void)getWordInfo:(NSString *)word completeBlock:(void(^)(ADCommunication *conn,id data))block;

@end
