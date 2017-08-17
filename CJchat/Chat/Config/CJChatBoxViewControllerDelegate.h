//
//  CJChatBoxViewControllerDelegate.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/22.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <Foundation/Foundation.h>

@class CJMessage;
@class CJChatBoxViewController;
@class CJVideoView;

@protocol CJChatBoxViewControllerDelegate <NSObject>

// change chatBox height
- (void) chatBoxViewController:(CJChatBoxViewController *)chatboxViewController
        didChangeChatBoxHeight:(CGFloat)height;
/**
 *  send text message
 *
 *  @param chatboxViewController chatboxViewController
 *  @param messageStr            text
 */
- (void) chatBoxViewController:(CJChatBoxViewController *)chatboxViewController
               sendTextMessage:(NSString *)messageStr;
/**
 *  send image message
 *
 *  @param chatboxViewController CJChatBoxViewController
 *  @param image                 image
 *  @param imgPath               image path
 */
- (void) chatBoxViewController:(CJChatBoxViewController *)chatboxViewController
              sendImageMessage:(UIImage *)image
                     imagePath:(NSString *)imgPath;

/**
 *  send voice message
 *
 *  @param chatboxViewController CJChatBoxViewController
 *  @param voicePath             voice path
 */
- (void) chatBoxViewController:(CJChatBoxViewController *)chatboxViewController sendVoiceMessage:(NSString *)voicePath;

- (void) voiceDidStartRecording;
// voice太短
- (void) voiceRecordSoShort;

- (void) voiceWillDragout:(BOOL)inside;

- (void) voiceDidCancelRecording;


- (void) chatBoxViewController:(CJChatBoxViewController *)chatboxViewController
            didVideoViewAppeared:(CJVideoView *)videoView;


- (void) chatBoxViewController:(CJChatBoxViewController *)chatboxViewController sendVideoMessage:(NSString *)videoPath;

- (void) chatBoxViewController:(CJChatBoxViewController *)chatboxViewController sendFileMessage:(NSString *)fileName;



@end
