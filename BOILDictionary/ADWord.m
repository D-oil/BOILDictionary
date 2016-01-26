//
//  Word.m
//  BOILDictionary
//
//  Created by andong on 16/1/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADWord.h"

@implementation ADWord
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        self.id = [dict objectForKey:@"id"];
        self.zi = [dict objectForKey:@"zi"];
        self.py = [dict objectForKey:@"py"];
        self.wubi = [dict objectForKey:@"wubi"];
        self.pinyin = [dict objectForKey:@"pinyin"];
        self.bushou = [dict objectForKey:@"bushou"];
        self.bihua = [dict objectForKey:@"bihua"];
        self.jijie = [dict objectForKey:@"jijie"];
        self.xiangjie = [dict objectForKey:@"xiangjie"];
    }
    return self;
}
@end
