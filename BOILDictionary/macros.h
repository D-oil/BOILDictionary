//
//  macros.h
//  BOILDictionary
//
//  Created by andong on 16/1/22.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#ifndef macros_h
#define macros_h

#define APPDELEGETE         ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define ADColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

#pragma mark - Frame
#define WIDTH_SCREEN        [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN       [UIScreen mainScreen].bounds.size.height
#define HEIGHT_STATUSBAR	20
#define HEIGHT_TABBAR       49
#define HEIGHT_NAVBAR       44
#define HEIGHT_CHATBOXVIEW  215
#define HEIGHT_SEARCHBAR    50

#define MARGIN_WIDTH        10
#define ZERO                0

#pragma mark - Color
#define     DEFAULT_NAVBAR_COLOR             ADColor(220, 0, 16, 0.9)
#define     DEFAULT_BACKGROUND_COLOR         ADColor(224, 231, 248, 1.0)
#define     DEFAULT_TBABAR_COLOR             ADColor(221, 53, 47, 1.0)

#define     DEFAULT_TEXT_COLOR               ADColor(242 ,67 ,59 , 1.0)

#define     DEFAULT_CHAT_BACKGROUND_COLOR    ADColor(235.0, 235.0, 235.0, 1.0)
#define     DEFAULT_CHATBOX_COLOR            ADColor(244.0, 244.0, 246.0, 1.0)
#define     DEFAULT_SEARCHBAR_COLOR          ADColor(239.0, 239.0, 244.0, 1.0)
#define     DEFAULT_GREEN_COLOR              ADColor(2.0, 187.0, 0.0, 1.0f)
#define     DEFAULT_TEXT_GRAY_COLOR          [UIColor grayColor]
#define     DEFAULT_LINE_GRAY_COLOR          ADColor(188.0, 188.0, 188.0, 0.6f)

#pragma mark - Path
#define     PATH_DOCUMENT                    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define     PATH_DOCUMENT_FILE(FILENAME)         [PATH_DOCUMENT stringByAppendingPathComponent:FILENAME]

#endif
