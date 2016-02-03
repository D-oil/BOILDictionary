//
//  ADShowwordCell.h
//  BOILDictionary
//
//  Created by andong on 16/2/3.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "ADWord.h"

@interface ADShowwordCell : CommonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithWord:(ADWord *)word;

@end
