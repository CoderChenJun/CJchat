//
//  CJEmotionButton.m
//  CJchat
//
//  Created by CoderChenJun on 16/4/6.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJEmotionButton.h"

@implementation CJEmotionButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}


- (void)setup
{
    self.titleLabel.font             = [UIFont systemFontOfSize:32.0];
    self.adjustsImageWhenHighlighted = NO;
}

- (void)setEmotion:(CJEmotion *)emotion
{
    _emotion               = emotion;
    if (emotion.code) {
        [self setTitle:self.emotion.code.emoji forState:UIControlStateNormal];
    } else if (emotion.face_name) {
        [self setImage:[UIImage imageNamed:self.emotion.face_name] forState:UIControlStateNormal];
    }
}



@end
