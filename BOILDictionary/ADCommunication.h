//
//  ADCommunication.h
//  BOILDictionary
//
//  Created by andong on 16/1/28.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADCommunication : NSObject

@property (nonatomic, assign) NSInteger resultCode;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, assign) BOOL success;

@end
