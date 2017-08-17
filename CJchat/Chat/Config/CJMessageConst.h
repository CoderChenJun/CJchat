//
//  CJMessageConst.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/17.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <Foundation/Foundation.h>


#define MessageFont [UIFont systemFontOfSize:16.0]
#define SenderNameFont [UIFont systemFontOfSize:13.0]

/************Const*************/

extern CGFloat const HEIGHT_STATUSBAR;
extern CGFloat const HEIGHT_NAVBAR;
extern CGFloat const HEIGHT_TABBAR;// 就是chatBox的高度
extern CGFloat const HEIGHT_CHATBOXVIEW;






/************Event*************/

extern NSString *const CJRouterEventVoiceTapEventName;
extern NSString *const CJRouterEventImageTapEventName;
extern NSString *const CJRouterEventTextUrlTapEventName;
extern NSString *const CJRouterEventMenuTapEventName;
extern NSString *const CJRouterEventVideoTapEventName;
extern NSString *const CJRouterEventShareTapEvent;

extern NSString *const CJRouterEventVideoRecordExit;
extern NSString *const CJRouterEventVideoRecordCancel;
extern NSString *const CJRouterEventVideoRecordFinish;
extern NSString *const CJRouterEventVideoRecordStart;
extern NSString *const CJRouterEventURLSkip;
extern NSString *const CJRouterEventScanFile;



/************Name*************/

extern NSString *const MessageKey;
extern NSString *const VoiceIcon;
extern NSString *const RedView;
// 消息类型
extern NSString *const TypeSystem;
extern NSString *const TypeText;
extern NSString *const TypeVoice;
extern NSString *const TypePic;
extern NSString *const TypeVideo;
extern NSString *const TypeFile;
extern NSString *const TypePicText;

/** 消息类型的KEY */
extern NSString *const MessageTypeKey;
extern NSString *const VideoPathKey;

extern NSString *const CJSelectEmotionKey;






/************Notification*************/

extern NSString *const CJEmotionDidSelectNotification;
extern NSString *const CJEmotionDidDeleteNotification;
extern NSString *const CJEmotionDidSendNotification;
//extern NSString *const NotificationReceiveUnreadMessage;
extern NSString *const NotificationDidCreatedConversation;
extern NSString *const NotificationFirstMessage;
extern NSString *const NotificationDidUpdateDeliver;
extern NSString *const NotificationPushDidReceived;
extern NSString *const NotificationDeliverChanged;
extern NSString *const NotificationBackMsgNotification;
extern NSString *const NotificationGPhotoDidChanged;
extern NSString *const NotificationReloadDataIMSource;
extern NSString *const NotificationUserHeadImgChangedNotification;
extern NSString *const NotificationKickUserNotification;
extern NSString *const NotificationShareExitNotification;
// 取消分享
extern NSString *const CJShareCancelNotification ;
// 确认分享
extern NSString *const CJShareConfirmNotification;
extern NSString *const CJShareStayInAppNotification;
extern NSString *const CJShareBackOtherAppNotification;


