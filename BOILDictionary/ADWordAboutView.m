//
//  ADWordAboutView.m
//  BOILDictionary
//
//  Created by andong on 16/2/18.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADWordAboutView.h"

@interface ADWordAboutView ()

@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic,strong)NSArray *detial;

@property (nonatomic,strong)UILabel *labview;

@property (nonatomic,assign)NSInteger index;
@end

@implementation ADWordAboutView

- (instancetype)initWithFrame:(CGRect)frame WithWord:(NSArray *)detial
{
    if (self = [super initWithFrame:frame])
    {
        self.detial = detial;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{

    [self addSubview:self.imageView];
    
    [self createLabel];

}

- (void)layoutSubviews
{
    [super layoutSubviews];

}

- (void)createLabel
{
    for (NSString *subStr in self.detial) {
        
        self.labview = [[UILabel alloc]init];//WithFrame:CGRectMake(10, 70 + 25 *num, WIDTH_SCREEN-20, 25)
        self.labview.text = subStr;
        [self.labview setNumberOfLines:0];

//        CGRect frame;
//        frame.origin.x = 10;
//        frame.origin.y = 70 + 25 *self.index;
//        frame.size = [self.labview.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
//        [self.labview setFrame:frame];

        //计算实际frame大小，并将label的frame变成实际大小
        CGSize labelsize = [subStr sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
        [self.labview setFrame:CGRectMake(10, 70+25*self.index, WIDTH_SCREEN -20, labelsize.height)];

        [self addSubview:self.labview];
        self.index ++;
        
    }
    return;
}
#define mark -getting and setting
- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jianjie"]];
        [_imageView setFrame:CGRectMake(0, 0, 71, 60)];
    }
    return _imageView;
}
@end
