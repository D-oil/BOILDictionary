//
//  ADRadicalCell.m
//  BOILDictionary
//
//  Created by andong on 16/2/3.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADRadicalCell.h"
#import "ADRadical.h"

#define BUTTONWH 40

@interface ADRadicalCell ()

@property (nonatomic,strong)NSArray *radicalList;

@property (nonatomic,strong)ADRadical *radical;

@property (nonatomic,strong)UILabel *bihuaLabel;


@end

@implementation ADRadicalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithRadical:(NSArray *)radicalList
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.radicalList = radicalList;
        
        [self initSubViews];
    }
    return self;
}
- (void)initSubViews
{
    [self.contentView addSubview:self.bihuaLabel];
    
    int ButtonTag = 0;
    
    for (ADRadical *radical in self.radicalList)
    {
        UIButton *radicalBtn = [[UIButton alloc]init];
        
        [radicalBtn setTitle:radical.bushou forState:UIControlStateNormal];
        [radicalBtn setTitle:radical.bushou forState:UIControlStateHighlighted];
        [radicalBtn setTitleColor:ADColor(52, 156, 197, 1) forState:UIControlStateNormal];
        [radicalBtn setTitleColor:ADColor(52, 156, 197, 1) forState:UIControlStateHighlighted];
    
        [radicalBtn setTag:ButtonTag];
        
        [radicalBtn setFrame:CGRectMake(60 + ButtonTag * (5+BUTTONWH), 10, BUTTONWH, BUTTONWH)];
        
        //垃圾代码。。。需重构
        if (radicalBtn.right > WIDTH_SCREEN) {
            [radicalBtn setFrame:CGRectMake(10 + (ButtonTag - 7) * (5+BUTTONWH), 50, BUTTONWH, BUTTONWH)];
            if (radicalBtn.right > WIDTH_SCREEN) {
                [radicalBtn setFrame:CGRectMake(10 + (ButtonTag - 15) * (5+BUTTONWH), 90, BUTTONWH, BUTTONWH)];
                if (radicalBtn.right > WIDTH_SCREEN) {
                    [radicalBtn setFrame:CGRectMake(10 + (ButtonTag - 23) * (5+BUTTONWH), 130, BUTTONWH, BUTTONWH)];
                    if (radicalBtn.right > WIDTH_SCREEN) {
                        [radicalBtn setFrame:CGRectMake(10 + (ButtonTag - 31) * (5+BUTTONWH), 170, BUTTONWH, BUTTONWH)];
                        if (radicalBtn.right > WIDTH_SCREEN) {
                            [radicalBtn setFrame:CGRectMake(10 + (ButtonTag - 39) * (5+BUTTONWH), 210, BUTTONWH, BUTTONWH)];
                            if (radicalBtn.right > WIDTH_SCREEN) {
                                [radicalBtn setFrame:CGRectMake(10 + (ButtonTag - 47) * (5+BUTTONWH), 250, BUTTONWH, BUTTONWH)];
                            }
                        }
                    }
                }
            }
        }
        
        [radicalBtn addTarget:self action:@selector(radicalAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:radicalBtn];
        
        ButtonTag ++;
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame;
    
    frame.origin.x = 20 ;
    frame.origin.y = 20 ;
    frame.size = [self.bihuaLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    [self.bihuaLabel setFrame:frame];
}

#pragma mark - action

- (void)radicalAction:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(radicalButton:WithRaducal:)]) {
        [self.delegate radicalButton:btn WithRaducal:btn.titleLabel.text];
    }
}

#pragma mark - getting and setting
- (UILabel *)bihuaLabel
{
    if (_bihuaLabel == nil) {
        _bihuaLabel = [[UILabel alloc]init];
        self.radical = self.radicalList[0];
        _bihuaLabel.text = [NSString stringWithFormat:@"%@ 画",self.radical.bihua];
    }
    return _bihuaLabel;
}


@end
