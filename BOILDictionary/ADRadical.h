//
//  ADRadical.h
//  BOILDictionary
//
//  Created by andong on 16/1/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADRadical : NSObject <NSCoding>

@property (nonatomic,assign) NSNumber *id;

@property (nonatomic,assign) NSNumber *bihua;

@property (nonatomic,copy) NSString *bushou;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
