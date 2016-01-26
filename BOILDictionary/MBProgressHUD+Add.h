//
//  MBProgressHUD+Add.h
//  BOILDictionary
//
//  Created by andong on 16/1/23.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)
+ (MBProgressHUD *)showError:(NSString *)error toView:(UIView *)view;
+ (MBProgressHUD *)showSuccess:(NSString *)success toView:(UIView *)view;

+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;
@end
