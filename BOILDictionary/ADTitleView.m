//
//  ADTitleView.m
//  BOILDictionary
//
//  Created by andong on 16/1/27.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADTitleView.h"

#define WORD_WIDTH_HIGHT 70

@interface ADTitleView ()

@property (nonatomic,strong)ADWord *word;

@property (nonatomic,strong) UIImageView *wordView;

@property (nonatomic,strong) UILabel *wordLabel;
//拼音label
@property (nonatomic,strong) UILabel *pinyinLabel;
//部首label
@property (nonatomic,strong) UILabel *radicalLabel;
//笔画label
@property (nonatomic,strong) UILabel *strokeLabel;
//五笔label
@property (nonatomic,strong) UILabel *wubiLabel;

@end

@implementation ADTitleView

-(instancetype)initWithFrame:(CGRect)frame WithWord:(ADWord *)word;
{
    if (self = [super initWithFrame:frame])
    {
        self.word = word;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.wordView];
    [self addSubview:self.wordLabel];
    [self addSubview:self.pinyinLabel];
    [self addSubview:self.radicalLabel];
    [self addSubview:self.strokeLabel];
    [self addSubview:self.wubiLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = self.bounds;
    
    [self.wordView setFrame:CGRectMake(MARGIN_WIDTH, MARGIN_WIDTH, WORD_WIDTH_HIGHT, WORD_WIDTH_HIGHT)];
    [self.wordLabel setFrame:self.wordView.frame];
    
    frame.origin.x = MARGIN_WIDTH + WORD_WIDTH_HIGHT +10;
    frame.origin.y = 2 * MARGIN_WIDTH;
    frame.size = [self.pinyinLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    [self.pinyinLabel setFrame:frame];
    
    
    frame.origin.x = MARGIN_WIDTH + WORD_WIDTH_HIGHT +10;
    frame.origin.y = self.pinyinLabel.bottom + MARGIN_WIDTH;
    frame.size = [self.radicalLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
    [self.radicalLabel setFrame:frame];
    
    frame.origin.x = self.radicalLabel.right + MARGIN_WIDTH;
    frame.origin.y = self.pinyinLabel.bottom + MARGIN_WIDTH;
    frame.size = [self.strokeLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
    [self.strokeLabel setFrame:frame];
    
    frame.origin.x = self.strokeLabel.right + MARGIN_WIDTH;
    frame.origin.y = self.pinyinLabel.bottom + MARGIN_WIDTH;
    frame.size = [self.wubiLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
    [self.wubiLabel setFrame:frame];
}

#define mark - getting and setting
- (UIView *)wordView
{
    if (_wordView == nil) {
        _wordView = [[UIImageView alloc]init];
        _wordView.image = [UIImage imageNamed:@"tianzige"];
    }
    return _wordView;
}

- (UILabel *)wordLabel
{
    if (_wordLabel == nil) {
        _wordLabel = [[UILabel alloc]init];
        _wordLabel.text = self.word.zi;
        _wordLabel.textColor = [UIColor blackColor];
        _wordLabel.font = [UIFont systemFontOfSize:40];
        _wordLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _wordLabel;
}

- (UILabel *)pinyinLabel
{
    if (_pinyinLabel == nil) {
        _pinyinLabel = [[UILabel alloc]init];
        _pinyinLabel.text = self.word.pinyin;
        _pinyinLabel.font = [UIFont systemFontOfSize:20];
        _pinyinLabel.textColor = DEFAULT_TEXT_COLOR;
    }
    return _pinyinLabel;
}

- (UILabel *)radicalLabel
{
    if (_radicalLabel == nil) {
        _radicalLabel = [[UILabel alloc]init];
        _radicalLabel.text = [NSString stringWithFormat:@"部首：%@",self.word.bushou];
        _radicalLabel.font = [UIFont systemFontOfSize:15];
    }
    return _radicalLabel;
}

- (UILabel *)strokeLabel
{
    if (_strokeLabel == nil) {
        _strokeLabel = [[UILabel alloc]init];
        _strokeLabel.text = [NSString stringWithFormat:@"笔画：%@ 画",self.word.bihua];
        _strokeLabel.font = [UIFont systemFontOfSize:15];
    }
    return _strokeLabel;
}

- (UILabel *)wubiLabel
{
    if (_wubiLabel == nil) {
        _wubiLabel = [[UILabel alloc]init];
        _wubiLabel.text = [NSString stringWithFormat:@"五笔：%@ ",self.word.wubi];
        _wubiLabel.font = [UIFont systemFontOfSize:15];
    }
    return _wubiLabel;
}


@end
