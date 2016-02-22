//
//  CTFrameParserConfig.m
//  coreText
//
//  Created by andong on 16/2/16.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig

- (instancetype)init
{
    if (self == [super init]) {
        self.width = 200.0f;
        self.fontSize = 16.0f;
        self.lineSpace = 8.0f;
        self.textColor = [UIColor colorWithRed:108 green:108 blue:108 alpha:1];
    }
    return self;
}

@end
