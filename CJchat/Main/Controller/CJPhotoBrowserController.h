//
//  CJPhotoBrowserController.h
//  CJchat
//
//  Created by CoderChenJun on 16/4/12.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJPhotoBrowserController : UIViewController

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong,) UIImageView *imageView;


- (instancetype)initWithImage:(UIImage *)image;


@end
