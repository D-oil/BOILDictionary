//
//  ADPinyin.m
//  BOILDictionary
//
//  Created by andong on 16/2/18.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADPinyin.h"

@implementation ADPinyin

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        self.id = [dict objectForKey:@"id"];
        self.key = [dict objectForKey:@"pinyin_key"];
        self.pinyin = [dict objectForKey:@"pinyin"];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.id = [decoder decodeObjectForKey:@"id"];
        self.key = [decoder decodeObjectForKey:@"pinyin_key"];
        self.pinyin = [decoder decodeObjectForKey:@"pinyin"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)enCoder
{
    [enCoder encodeObject:self.id forKey:@"id"];
    [enCoder encodeObject:self.key forKey:@"pinyin_key"];
    [enCoder encodeObject:self.pinyin forKey:@"pinyin"];
}

@end
