//
//  CJShareButton.h
//  CJchat
//
//  Created by CoderChenJun on 16/9/8.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>
@class CJMessageModel;

@interface CJShareButton : UIButton

@property (nonatomic, strong) CJMessageModel *messageModel;

@end
