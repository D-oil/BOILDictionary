//
//  CTFrameParser.h
//  coreText
//
//  Created by andong on 16/2/16.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTFrameParserConfig.h"
#import "CoreTextDate.h"

@interface CTFrameParser : NSObject

+ (CoreTextDate *)parseContent:(NSString *)content config:(CTFrameParserConfig *)config;

@end
