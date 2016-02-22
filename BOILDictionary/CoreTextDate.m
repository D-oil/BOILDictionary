//
//  CoreTextDate.m
//  coreText
//
//  Created by andong on 16/2/16.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "CoreTextDate.h"

@implementation CoreTextDate

- (void)setCtFrame:(CTFrameRef)ctFrame
{
    if (self.ctFrame != ctFrame) {
        if (self.ctFrame != nil) {
            CFRelease(self.ctFrame);
        }
        CFRetain(ctFrame);
        self.ctFrame = ctFrame;
    }
}

- (void)dealloc
{
    if (_ctFrame != nil) {
        CFRelease(self.ctFrame);
        self.ctFrame = nil;
    }
}

@end
