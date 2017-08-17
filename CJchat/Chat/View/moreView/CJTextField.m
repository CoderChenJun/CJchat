//
//  CJTextField.m
//  CJchat
//
//  Created by CoderChenJun on 16/4/28.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJTextField.h"

@implementation CJTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self becomeFirstResponder];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return self;
}








@end
