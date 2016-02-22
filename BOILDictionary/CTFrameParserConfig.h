//
//  CTFrameParserConfig.h
//  coreText
//
//  Created by andong on 16/2/16.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface CTFrameParserConfig : NSObject

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat fontSize;

@property (nonatomic, assign) CGFloat lineSpace;

@property (nonatomic, strong) UIColor *textColor;

@end
