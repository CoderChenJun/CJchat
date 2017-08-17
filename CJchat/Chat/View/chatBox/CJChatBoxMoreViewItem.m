//
//  CJChatBoxMoreViewItem.m
//  CJchat
//
//  Created by CoderChenJun on 16/3/14.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJChatBoxMoreViewItem.h"

@interface CJChatBoxMoreViewItem ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CJChatBoxMoreViewItem

/**
 *  创建一个CJChatBoxMoreViewItem
 *
 *  @param title     item的标题
 *  @param imageName item的图片
 *
 *  @return item
 */
+ (CJChatBoxMoreViewItem *) createChatBoxMoreItemWithTitle:(NSString *)title imageName:(NSString *)imageName{
    CJChatBoxMoreViewItem *item = [[CJChatBoxMoreViewItem alloc] init];
    item.title = title;
    item.imageName = imageName;
    return item;
}

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.button];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    float w = 59;
    [self.button setFrame:CGRectMake((self.width - w) / 2, 0, w, w)];
    [self.titleLabel setFrame:CGRectMake(-5, self.button.height + 5, self.width + 10, 15)];
}

#pragma mark - Public Method

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    [self.button addTarget:target action:action forControlEvents:controlEvents];
}

- (void) setTag:(NSInteger)tag
{
    [super setTag:tag];
    [self.button setTag:tag];
}

#pragma mark - Setter

- (void) setTitle:(NSString *)title
{
    _title = title;
    [self.titleLabel setText:title];
}

- (void) setImageName:(NSString *)imageName
{
    _imageName = imageName;
    [self.button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
#pragma mark - Getter

- (UIButton *) button
{
    if (_button == nil) {
        _button = [[UIButton alloc] init];
        [_button.layer setMasksToBounds:YES];
        [_button.layer setCornerRadius:10.0f];
        [_button.layer setBorderWidth:0.5f];
        [_button.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [_button setBackgroundColor:CJColor(251, 251, 251)];
    }
    return _button;
}

- (UILabel *) titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [_titleLabel setTextColor:[UIColor grayColor]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}





@end
