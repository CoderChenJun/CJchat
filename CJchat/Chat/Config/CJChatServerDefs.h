//
//  CJChatServerDefs.h
//  CJchat
//
//  Created by CoderChenJun on 16/4/7.
//  Copyright © 2016年 zwu All rights reserved.
//

#ifndef CJChatServerDefs_h
#define CJChatServerDefs_h



// 消息发送状态
typedef enum {
    CJMessageDeliveryState_Pending = 0,  // 待发送
    CJMessageDeliveryState_Delivering,   // 正在发送
    CJMessageDeliveryState_Delivered,    // 已发送，成功
    CJMessageDeliveryState_Failure,      // 发送失败
    CJMessageDeliveryState_ServiceFaid   // 发送服务器失败(可能其它错,待扩展)
}MessageDeliveryState;



// 消息类型
typedef enum {
    CJMessageType_Text  = 1,             // 文本
    CJMessageType_Voice,                 // 短录音
    CJMessageType_Image,                 // 图片
    CJMessageType_Video,                 // 短视频
    CJMessageType_Doc,                   // 文档
    CJMessageType_TextURL,               // 文本＋链接
    CJMessageType_ImageURL,              // 图片＋链接
    CJMessageType_URL,                   // 纯链接
    CJMessageType_DrtNews,               // 送达号
    CJMessageType_NTF   = 12,            // 通知
    
    CJMessageType_DTxt  = 21,            // 纯文本
    CJMessageType_DPic  = 22,            // 文本＋单图
    CJMessageType_DMPic = 23,            // 文本＋多图
    CJMessageType_DVideo= 24,            // 文本＋视频
    CJMessageType_PicURL= 25             // 动态图文链接
    
}CJMessageType;



typedef enum {
    CJGroup_SELF = 0,                    // 自己
    CJGroup_DOUBLE,                      // 双人组
    CJGroup_MULTI,                       // 多人组
    CJGroup_TODO,                        // 待办
    CJGroup_QING,                        // 轻应用
    CJGroup_NATIVE,                      // 原生应用
    CJGroup_DISCOVERY,                   // 发现
    CJGroup_DIRECT,                      // 送达号
    CJGroup_NOTIFY,                      // 通知
    CJGroup_BOOK                         // 通讯录
}CJGroupType;



// 消息状态
typedef enum {
    CJMessageStatus_unRead = 0,          // 消息未读
    CJMessageStatus_read,                // 消息已读
    CJMessageStatus_back                 // 消息撤回
}CJMessageStatus;



typedef enum {
    CJActionType_READ = 1,               // 语音已读
    CJActionType_BACK,                   // 消息撤回
    CJActionType_UPTO,                   // 消息读数
    CJActionType_KICK,                   // 请出会话
    CJActionType_OPOK,                   // 待办已办
    CJActionType_BDRT,                   // 送达号消息撤回
    CJActionType_GUPD,                   // 群信息修改
    CJActionType_UUPD,                   // 群成员信息修改
    CJActionType_DUPD,                   // 送达号信息修改
    CJActionType_OFFL = 10,              // 请您下线
    CJActionType_STOP = 11,              // 清除所有缓存
    CJActionType_UUPN                    // 改昵称

}CJActionType;



typedef NS_ENUM(NSInteger, CJChatBoxStatus) {
    CJChatBoxStatusNothing,     // 默认状态
    CJChatBoxStatusShowVoice,   // 录音状态
    CJChatBoxStatusShowFace,    // 输入表情状态
    CJChatBoxStatusShowMore,    // 显示“更多”页面状态
    CJChatBoxStatusShowKeyboard,// 正常键盘
    CJChatBoxStatusShowVideo    // 录制视频
};



typedef enum {
    CJDeliverSubStatus_Can        = 0,   // 可订阅
    CJDeliverSubStatus_Already,
    CJDeliverSubStatus_System
}CJDeliverSubStatus;



typedef enum {
    CJDeliverTopStatus_NO         = 0, // 非置顶
    CJDeliverTopStatus_YES             // 置顶
}CJDeliverTopStatus;



typedef enum {
    CJFileType_Other = 0,                // 其它类型
    CJFileType_Audio,                    //
    CJFileType_Video,                    //
    CJFileType_Html,
    CJFileType_Pdf,
    CJFileType_Doc,
    CJFileType_Xls,
    CJFileType_Ppt,
    CJFileType_Img,
    CJFileType_Txt
}CJFileType;














#endif /* CJChatServerDefs_h */













