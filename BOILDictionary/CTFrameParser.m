//
//  CTFrameParser.m
//  coreText
//
//  Created by andong on 16/2/16.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "CTFrameParser.h"

@implementation CTFrameParser

+ (NSDictionary *)attributesWithConfig:(CTFrameParserConfig *)config
{
    CGFloat fontSize = config.fontSize;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
    CGFloat lineSpacing = config.lineSpace;
    const CFIndex kNumberOfSettings = 3;
    CTParagraphStyleSetting theSetting[kNumberOfSettings] =
    {
        { kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat),&lineSpacing},
        { kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat),&lineSpacing},
        { kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat),&lineSpacing}
    };
    
    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSetting, kNumberOfSettings);
    
    UIColor *textColor = config.textColor;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[(id)kCTForegroundColorFromContextAttributeName] = (id)textColor.CGColor;
    dict[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dict[(id)kCTParagraphStyleAttributeName] = (__bridge id)theParagraphRef;
    
    CFRelease(theParagraphRef);
    CFRelease(fontRef);
    
    return dict;
}



+ (CoreTextDate *)parseContent:(NSString *)content config:(CTFrameParserConfig *)config
{
    NSDictionary *attributes = [self attributesWithConfig:config];
    
    NSAttributedString *contentString = [[NSAttributedString alloc]initWithString:content attributes:attributes];

    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)contentString);
    
    CGSize restrictSize = CGSizeMake(config.width, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSize, nil);
    CGFloat textHeight = coreTextSize.height;
    
    CTFrameRef frame = [self createFrameWithFramesetter:framesetter config:config height:textHeight];
    
    CoreTextDate *data = [[CoreTextDate alloc]init];
    data.ctFrame = frame;
    data.height = textHeight;
    return data;
}

+ (CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter
                                  config:(CTFrameParserConfig *)comfig
                                  height:(CGFloat)height
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, comfig.width, height));
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    return frame;
}
@end
