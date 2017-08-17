//
//  CJFileButton.h
//  CJchat
//
//  Created by CoderChenJun on 16/7/21.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJMessageModel;

@interface CJFileButton : UIButton

@property (nonatomic, strong) CJMessageModel *messageModel;

@property (nonatomic, strong) UILabel *identLabel;

@property (nonatomic, strong) UIProgressView *progressView;

@end
