//
//  ADPinyin.h
//  BOILDictionary
//
//  Created by andong on 16/2/18.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADPinyin : NSObject <NSCoding>

@property (nonatomic,copy)NSString *id;

@property (nonatomic,copy)NSString *key;

@property (nonatomic,copy)NSString *pinyin;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
