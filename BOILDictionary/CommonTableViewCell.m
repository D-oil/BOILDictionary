//
//  CommonTableViewCell.m
//  BOILDictionary
//
//  Created by andong on 16/1/27.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "CommonTableViewCell.h"

@implementation CommonTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _topLineStyle = CellLineStyleNone;
        _bottomLineStyle = CellLineStyleDefault;
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    [self.topLine setTop:0];
    [self.bottomLine setTop:self.height - _bottomLine.height];
    [self setBottomLineStyle:_bottomLineStyle];
    [self setTopLineStyle:_topLineStyle];
}

- (void) setTopLineStyle:(CellLineStyle)style
{
    _topLineStyle = style;
    if (style == CellLineStyleDefault) {
        [self.topLine setLeft:_leftFreeSpace];
        [self.topLine setWidth:self.width - _leftFreeSpace];
        [self.topLine setHidden:NO];
    }
    else if (style == CellLineStyleFill) {
        [self.topLine setTop:0];
        [self.topLine setWidth:self.width];
        [self.topLine setHidden:NO];
    }
    else if (style == CellLineStyleNone) {
        [self.topLine setHidden:YES];
    }
}

- (void) setBottomLineStyle:(CellLineStyle)style
{
    _bottomLineStyle = style;
    if (style == CellLineStyleDefault) {
        [self.bottomLine setLeft:_leftFreeSpace];
        [self.bottomLine setWidth:self.width - _leftFreeSpace];
        [self.bottomLine setHidden:NO];
    }
    else if (style == CellLineStyleFill) {
        [self.bottomLine setLeft:0];
        [self.bottomLine setWidth:self.width];
        [self.bottomLine setHidden:NO];
    }
    else if (style == CellLineStyleNone) {
        [self.bottomLine setHidden:YES];
    }
}

- (UIView *) bottomLine
{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        [_bottomLine setHeight:0.5f];
        [_bottomLine setBackgroundColor:[UIColor grayColor]];
        [_bottomLine setAlpha:0.4];
        [self.contentView addSubview:_bottomLine];
    }
    return _bottomLine;
}

- (UIView *) topLine
{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] init];
        [_topLine setHeight:0.5f];
        [_topLine setBackgroundColor:[UIColor grayColor]];
        [_topLine setAlpha:0.4];
        [self.contentView addSubview:_topLine];
    }
    return _topLine;
}

@end
