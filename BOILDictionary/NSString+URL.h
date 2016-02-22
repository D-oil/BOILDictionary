//
//  NSString+URL.h
//  BOILDictionary
//
//  Created by andong on 16/1/28.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    REQUEST_GET_XINHUA_RADICALLIST,
    REQUEST_GET_XINHUA_SINGLERADICALLIST,
    REQUEST_GET_XINHUA_WORDINFO,
    REQUEST_GET_XINHUA_PINYIN,
    REQUEST_GET_XINHUA_SINGLEPINYIN,
    
    REQUEST_GET_CHENGYU_SINGLECHENGYU
}RequestID;
typedef enum
{
    XML,
    JSON
}DataType;

@interface NSString (URL)

+ (NSString *)urlStringWithRequestID:(RequestID)requestID
                           dataType:(DataType)DataType;


@end
