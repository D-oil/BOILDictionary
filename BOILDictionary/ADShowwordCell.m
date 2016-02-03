//
//  ADShowwordCell.m
//  BOILDictionary
//
//  Created by andong on 16/2/3.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADShowwordCell.h"
#import "ADTitleView.h"
#import "ADWord.h"

@interface ADShowwordCell ()

@property (nonatomic,strong)ADTitleView *titleView;

@property (nonatomic,strong) ADWord *word;

@end


@implementation ADShowwordCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithWord:(ADWord *)word;
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.word = word;
        [self addSubview:self.titleView];
        
        
    }
    return self;
}



#define mark - getting and setting
- (ADTitleView *)titleView
{
    if (_titleView == nil) {
        _titleView = [[ADTitleView alloc]initWithFrame:CGRectMake(ZERO, ZERO, WIDTH_SCREEN, 70) WithWord:self.word];
    }
    return _titleView;
}

@end
