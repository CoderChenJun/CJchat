//
//  CJChatBox.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/10.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJChatConst.h"


@class CJChatBox;
@protocol CJChatBoxDelegate <NSObject>
/**
 *  输入框状态(位置)改变
 *
 *  @param chatBox    chatBox
 *  @param fromStatus 起始状态
 *  @param toStatus   目的状态
 */
- (void)chatBox:(CJChatBox *)chatBox changeStatusForm:(CJChatBoxStatus)fromStatus to:(CJChatBoxStatus)toStatus;

/**
 *  发送消息
 *
 *  @param chatBox     chatBox
 *  @param textMessage 消息
 */
- (void)chatBox:(CJChatBox *)chatBox sendTextMessage:(NSString *)textMessage;

/**
 *  输入框高度改变
 *
 *  @param chatBox chatBox
 *  @param height  height
 */
- (void)chatBox:(CJChatBox *)chatBox changeChatBoxHeight:(CGFloat)height;

/**
 *  开始录音
 *
 *  @param chatBox chatBox
 */
- (void)chatBoxDidStartRecordingVoice:(CJChatBox *)chatBox;
- (void)chatBoxDidStopRecordingVoice:(CJChatBox *)chatBox;
- (void)chatBoxDidCancelRecordingVoice:(CJChatBox *)chatBox;
- (void)chatBoxDidDrag:(BOOL)inside;


@end


@interface CJChatBox : UIView
/** 保存状态 */
@property (nonatomic, assign) CJChatBoxStatus status;

@property (nonatomic, weak) id<CJChatBoxDelegate>delegate;

/** 输入框 */
@property (nonatomic, strong) UITextView *textView;


@end
