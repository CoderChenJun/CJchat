//
//  CJHeadImageView.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/8.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJHeadImageView : UIView

@property (nonatomic, weak) UIImageView *imageView;

- (void)setColor:(UIColor *)color bording:(CGFloat)bording;

@end
