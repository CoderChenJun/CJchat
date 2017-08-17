//
//  CJEmotionPageView.m
//  CJchat
//
//  Created by CoderChenJun on 16/4/6.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJEmotionPageView.h"
#import "CJMessageConst.h"
#import "CJEmotion.h"
#import "CJEmotionButton.h"
#import "CJFaceManager.h"

@interface CJEmotionPageView ()

@property (nonatomic, weak) UIButton *deleteBtn;

@end

@implementation CJEmotionPageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [deleteBtn setImage:[UIImage imageNamed:@"emotion_delete"] forState:UIControlStateNormal];
        [deleteBtn addTarget:self action:@selector(deleteBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:deleteBtn];
        self.deleteBtn       =  deleteBtn;
    }
    return self;
}


#pragma mark - Private

- (void)deleteBtnClicked:(UIButton *)deleteBtn
{
    [[NSNotificationCenter defaultCenter] postNotificationName:CJEmotionDidDeleteNotification object:nil];// 通知出去
}

- (void)setEmotions:(NSArray *)emotions
{
    _emotions                   = emotions;
    NSUInteger count            = emotions.count;
    for (int i = 0; i < count; i ++) {
        CJEmotionButton *button = [[CJEmotionButton alloc] init];
        [self addSubview:button];
        button.emotion          = emotions[i];
        [button addTarget:self action:@selector(emotionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat inset            = 15;
    NSUInteger count         = self.emotions.count;
    CGFloat btnW             = (self.width - 2*inset)/CJEmotionMaxCols;
    CGFloat btnH             = (self.height - 2*inset)/CJEmotionMaxRows;
    for (int i = 0; i < count; i ++) {
        CJEmotionButton *btn = self.subviews[i + 1];//因为已经加了一个deleteBtn了
        btn.width            = btnW;
        btn.height           = btnH;
        btn.x                = inset + (i % CJEmotionMaxCols)*btnW;
        btn.y                = inset + (i / CJEmotionMaxCols)*btnH;
    }
    self.deleteBtn.width     = btnW;
    self.deleteBtn.height    = btnH;
    self.deleteBtn.x         = inset + (count%CJEmotionMaxCols)*btnW;
    self.deleteBtn.y         = inset + (count/CJEmotionMaxCols)*btnH;
}


- (void)emotionBtnClicked:(CJEmotionButton *)button
{
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[CJSelectEmotionKey]  = button.emotion;
    [[NSNotificationCenter defaultCenter] postNotificationName:CJEmotionDidSelectNotification object:nil userInfo:userInfo];
}


@end
