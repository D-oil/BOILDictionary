//
//  Word.h
//  BOILDictionary
//
//  Created by andong on 16/1/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADWord : NSObject

@property (nonatomic,copy)NSString *id;
@property (nonatomic,copy)NSString *zi;
@property (nonatomic,copy)NSString *py;
@property (nonatomic,copy)NSString *wubi;
@property (nonatomic,copy)NSString *pinyin;
@property (nonatomic,copy)NSString *bushou;
@property (nonatomic,copy)NSString *bihua;
@property (nonatomic,strong)NSArray *jijie;
@property (nonatomic,strong)NSArray *xiangjie;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
