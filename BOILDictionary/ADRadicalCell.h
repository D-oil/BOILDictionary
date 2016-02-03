//
//  ADRadicalCell.h
//  BOILDictionary
//
//  Created by andong on 16/2/3.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "CommonTableViewCell.h"

@class ADRadical,ADRadical;
@protocol ADRadicalCellDelegate <NSObject>

- (void)radicalButton:(UIButton *)radicalBtn WithRaducal:(NSString *)radical;

@end

@interface ADRadicalCell : CommonTableViewCell

@property(nonatomic, weak)id<ADRadicalCellDelegate>delegate;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithRadical:(NSArray *)radicalList;

@end
