//
//  ADRadical.m
//  BOILDictionary
//
//  Created by andong on 16/1/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADRadical.h"

@implementation ADRadical

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init] ) {
        self.id = [dict objectForKey:@"id"];
        self.bihua = [dict objectForKey:@"bihua"];
        self.bushou = [dict objectForKey:@"bushou"];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.id = [decoder decodeObjectForKey:@"id"];
        self.bihua = [decoder decodeObjectForKey:@"bihua"];
        self.bushou = [decoder decodeObjectForKey:@"bushou"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)enCoder
{
    [enCoder encodeObject:self.id forKey:@"id"];
    [enCoder encodeObject:self.bihua forKey:@"bihua"];
    [enCoder encodeObject:self.bushou forKey:@"bushou"];
}



@end
