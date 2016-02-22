//
//  CoreTextDate.h
//  coreText
//
//  Created by andong on 16/2/16.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface CoreTextDate : NSObject

@property (nonatomic,assign)CTFrameRef ctFrame;

@property (nonatomic,assign)CGFloat height;

@property (strong, nonatomic) NSAttributedString *content;
@end
