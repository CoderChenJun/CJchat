//
//  CJEmotionMenuButton.m
//  CJchat
//
//  Created by CoderChenJun on 16/4/5.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJEmotionMenuButton.h"

@implementation CJEmotionMenuButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
        self.titleLabel.font  = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}







@end
