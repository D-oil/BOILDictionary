//
//  NSString+URL.m
//  BOILDictionary
//
//  Created by andong on 16/1/28.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)


+ (NSString*)urlStringWithRequestID:(RequestID)requestID
                           dataType:(DataType)dataType
{
    NSString *str = nil;
    NSString *type = nil;
    switch (dataType) {
        case XML:
            type = @"xml";
            break;
        case JSON:
            type = @"json";
        default:
            break;
    }
    
    switch (requestID)
    {
        case REQUEST_GET_XINHUA_RADICALLIST:
            str = [NSString stringWithFormat:@"http://v.juhe.cn/xhzd/bushou?dtype=%@&key=543123d8aa4a7dfe947b2c9e1fbacae2",type];
            break;
        case REQUEST_GET_XINHUA_SINGLERADICALLIST:
            str = [NSString stringWithFormat:@"http://v.juhe.cn/xhzd/querybs"];
            break;
        case REQUEST_GET_XINHUA_WORDINFO:
            str = [NSString stringWithFormat:@"http://v.juhe.cn/xhzd/query"];
            break;
        default:
            break;
    }
    return str;
}

@end
