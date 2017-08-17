//
//  CJChatMessageBaseCell.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/12.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJMessageFrame.h"
#import "UIResponder+CJ.h"
#import "CJMessageConst.h"
#import "CJHeadImageView.h"

@class CJChatMessageBaseCell;
@protocol BaseCellDelegate <NSObject>

- (void)longPress:(UILongPressGestureRecognizer *)longRecognizer;

@optional
- (void)headImageClicked:(NSString *)eId;
- (void)reSendMessage:(CJChatMessageBaseCell *)baseCell;

@end

@interface CJChatMessageBaseCell : UITableViewCell

@property (nonatomic, weak) id<BaseCellDelegate> longPressDelegate;


@property (nonatomic, strong) UILabel *senderNameLabel;

// 消息模型
@property (nonatomic, strong) CJMessageFrame *modelFrame;
// 头像
@property (nonatomic, strong) CJHeadImageView *headImageView;
// 内容气泡视图
@property (nonatomic, strong) UIImageView *bubbleView;
// 菊花视图所在的view
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
// 重新发送
@property (nonatomic, strong) UIButton *retryButton;



@end
