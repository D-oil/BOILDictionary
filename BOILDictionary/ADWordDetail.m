//
//  ADWordDetail.m
//  BOILDictionary
//
//  Created by andong on 16/2/17.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADWordDetail.h"
#import <CoreText/CoreText.h>
#import "CTDisplayView.h"
#import "CTFrameParser.h"
#import "CTFrameParserConfig.h"

@interface ADWordDetail ()

@property (strong, nonatomic) CTDisplayView *ctView;

@end

@implementation ADWordDetail

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.ctView];
    }
    return self;
}

- (CTDisplayView *)ctView
{
    if (_ctView == nil) {
        _ctView = [[CTDisplayView alloc]init];
        CTFrameParserConfig *config = [[CTFrameParserConfig alloc]init];
        config.textColor = [UIColor redColor];
        config.width = self.ctView.frame.size.width;
        
        CoreTextDate *data = [CTFrameParser parseContent:@"waofaisdada widanfjanfjaldjlkajdlajdlasdadasjdkajdkl啊山坡的坡安静的" config:config];
        
        _ctView.data = data;
        _ctView.height = data.height;
        _ctView.backgroundColor = [UIColor yellowColor];
    }
    return _ctView;
}

@end
