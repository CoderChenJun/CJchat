//
//  CJMessageHelper.m
//  CJchat
//
//  Created by CoderChenJun on 16/4/7.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJMessageHelper.h"
#import "CJMessageFrame.h"
#import "CJMessageModel.h"
#import "CJMessageConst.h"
#import "CJRecordManager.h"
#import "CJMediaManager.h"
#import "CJVideoManager.h"
#import "CJFileTool.h"
#import "NSDate+CJ.h"
#import "VoiceConverter.h"


#define lastUpdateKey [NSString stringWithFormat:@"%@-%@",[ICUser currentUser].eId,@"LastUpdate"]
#define groupInfoLastUpdateKey [NSString stringWithFormat:@"%@-%@",[ICUser currentUser].eId,@"groupInfoLastUpdate"]
#define directLastUpdateKey [NSString stringWithFormat:@"%@-%@",[ICUser currentUser].eId,@"directLastUpdate"]

@implementation CJMessageHelper


// 创建一条本地消息
+ (CJMessageFrame *)createMessageFrame:(NSString *)type
                            senderName:(NSString *)senderName
                               content:(NSString *)content
                                  path:(NSString *)path
                                  from:(NSString *)from
                                    to:(NSString *)to
                               fileKey:(NSString *)fileKey
                              isSender:(BOOL)isSender
              receivedSenderByYourself:(BOOL)receivedSenderByYourself;
{
    CJMessage *message    = [[CJMessage alloc] init];
    
    message.senderName    = senderName;
    
    message.to            = to;
    message.from          = from;
    message.fileKey       = fileKey;
    // 我默认了一个本机的当前时间，其实没用到，成功后都改成服务器时间了
    message.date          = [CJMessageHelper currentMessageTime];
    CJMessageModel *model = [[CJMessageModel alloc] init];
    type = [self cellTypeWithMessageType:type];
    message.type          = type;
    if ([type isEqualToString:TypeText]) {
        message.content = content;
    } else if ([type isEqualToString:TypePic]) {
        message.content = @"[图片]";
    } else if ([type isEqualToString:TypeVoice]) {
        message.content = @"[语音]";
    } else if ([type isEqualToString:TypeVideo]) {
        message.content = @"[视频]";
    } else if ([type isEqualToString:TypeFile]) {
        message.content = content;
    } else if ([type isEqualToString:TypeSystem]) {
        message.content = content;
    } else {
        message.content = content;
    }
    model.isSender        = isSender;
    model.mediaPath       = path;
    if (isSender) {
        message.deliveryState = CJMessageDeliveryState_Delivering;
    } else {
        message.deliveryState = CJMessageDeliveryState_Delivered;
    }
    if (receivedSenderByYourself) { // 接收到的信息是自己发的
        message.deliveryState = CJMessageDeliveryState_Delivered;
        model.isSender        = YES;
    }
    model.message = message;
    CJMessageFrame *modelF = [[CJMessageFrame alloc] init];
    modelF.model = model;
    return modelF;
}


+ (CJMessageFrame *)createMessageMeReceiverFrame:(NSString *)type
                                      senderName:(NSString *)senderName
                                         content:(NSString *)content
                                            path:(NSString *)path
                                            from:(NSString *)from
                                         fileKey:(NSString *)fileKey
{
    CJMessage *message = [[CJMessage alloc] init];
    
    message.senderName = senderName;
    
    message.type       = type;
    CJMessageModel *model = [[CJMessageModel alloc] init];
    message.fileKey    = fileKey;
    model.isSender = NO;
    message.content    = content;
    model.mediaPath    = path;
    message.deliveryState = CJMessageDeliveryState_Delivered;
    model.message = message;
    CJMessageFrame *modelF = [[CJMessageFrame alloc] init];
    modelF.model = model;
    return modelF;
}

+ (CJMessageFrame *)createTimeMessageFrame:(NSString *)type
                                senderName:(NSString *)senderName
                                   content:(NSString *)content
                                      path:(NSString *)path
                                      from:(NSString *)from
                                        to:(NSString *)to
                                   fileKey:(NSString *)fileKey
                                  isSender:(BOOL)isSender
                  receivedSenderByYourself:(BOOL)receivedSenderByYourself
{
    CJMessage *message    = [[CJMessage alloc] init];
    
    message.senderName = senderName;
    
    message.to            = to;
    message.from          = from;
    message.fileKey       = fileKey;
    // 我默认了一个本机的当前时间，其实没用到，成功后都改成服务器时间了
    message.date          = [CJMessageHelper currentMessageTime];
    CJMessageModel *model = [[CJMessageModel alloc] init];
    type = [self cellTypeWithMessageType:type];
    message.type          = type;
    if ([type isEqualToString:TypeText]) {
        message.content = content;
    } else if ([type isEqualToString:TypePic]) {
        message.content = @"[图片]";
    } else if ([type isEqualToString:TypeVoice]) {
        message.content = @"[语音]";
    } else if ([type isEqualToString:TypeVideo]) {
        message.content = @"[视频]";
    } else if ([type isEqualToString:TypeFile]) {
        message.content = @"[文件]";
    } else if ([type isEqualToString:TypeSystem]) {
        message.content = content;
    }
    model.isSender        = isSender;
    model.mediaPath       = path;
    if (isSender) {
        message.deliveryState = CJMessageDeliveryState_Delivering;
    } else {
        message.deliveryState = CJMessageDeliveryState_Delivered;
    }
    if (receivedSenderByYourself) { // 接收到得信息是自己发的
        message.deliveryState = CJMessageDeliveryState_Delivered;
        model.isSender        = YES;
    }
    model.message = message;
    CJMessageFrame *modelF = [[CJMessageFrame alloc] init];
    modelF.model = model;
    return modelF;
}


/**
 *  创建一条发送消息
 *
 *  @param type    消息类型
 *  @param content 消息文本内容，其它类型的类型名称:[图片]
 *  @param fileKey 音频文件的fileKey
 *  @param from    发送者
 *  @param to      接收者
 *  @param lnk     连接地址URL,图片格式,文件名称 （目前没用到）
 *  @param status  消息状态 （目前没用到）
 *
 *  @return 发送的消息
 */
+ (CJMessage *)createSendMessage:(NSString *)type
                      senderName:(NSString *)senderName
                         content:(NSString *)content
                         fileKey:(NSString *)fileKey
                            from:(NSString *)from
                              to:(NSString *)to
                             lnk:(NSString *)lnk
                          status:(NSString *)status
{
    CJMessage *message    = [[CJMessage alloc] init];
    
    message.senderName = senderName;
    
    message.from          = from;
    message.to            = to;
    message.content       = content;
    message.fileKey       = fileKey;
    message.lnk           = lnk;
    if ([type isEqualToString:TypeText]) {
        message.type      = @"1";
    } else if ([type isEqualToString:TypePic]) {
        message.type      = @"3";
    } else if ([type isEqualToString:TypeVoice]) {
        message.type      = @"2";
    } else if ([type isEqualToString:TypeVideo]) {
        message.type      = @"4";
    } else if ([type isEqualToString:TypeFile]) {
        message.type      = @"5";
    }else if ([type isEqualToString:TypePicText]) {
        message.type      = @"7";
    }
//    message.localMsgId    = [self localMessageId:content];
    message.date          = [CJMessageHelper currentMessageTime];
    return message;
}


// 获取语音消息时长
+ (CGFloat)getVoiceTimeLengthWithPath:(NSString *)path
{
    AVURLAsset* audioAsset =[AVURLAsset URLAssetWithURL:[NSURL fileURLWithPath:path] options:nil];
    CMTime audioDuration = audioAsset.duration;
    CGFloat audioDurationSeconds =CMTimeGetSeconds(audioDuration);
    return audioDurationSeconds;
}

// 图片按钮在窗口中得位置
+ (CGRect)photoFramInWindow:(UIButton *)photoView
{
    return [photoView convertRect:photoView.bounds toView:[UIApplication sharedApplication].keyWindow];
}

// 放大后的图片按钮在窗口中的位置
+ (CGRect)photoLargerInWindow:(UIButton *)photoView
{
//    CGSize imgSize     = photoView.imageView.image.size;
    CGSize  imgSize    = photoView.currentBackgroundImage.size;
    CGFloat appWidth   = [UIScreen mainScreen].bounds.size.width;
    CGFloat appHeight  = [UIScreen mainScreen].bounds.size.height;
    CGFloat height     = imgSize.height / imgSize.width * appWidth;
    CGFloat photoY     = 0;
    if (height < appHeight) {
        photoY         = (appHeight - height) * 0.5;
    }
    return CGRectMake(0, photoY, appWidth, height);
}

// 根据消息类型得到cell的标识
+ (NSString *)cellTypeWithMessageType:(NSString *)type
{
    if ([type isEqualToString:@"1"]) {
        return TypeText;
    } else if ([type isEqualToString:@"2"]) {
        return TypeVoice;
    } else if ([type isEqualToString:@"3"]) {
        return TypePic;
    } else if ([type isEqualToString:@"4"]) {
        return TypeVideo;
    } else if ([type isEqualToString:@"5"]) {
        return TypeFile;
    } else {
        return type;
    }
}

// 删除消息附件
+ (void)deleteMessage:(CJMessageModel *)messageModel
{
    if ([CJFileTool fileExistsAtPath:messageModel.mediaPath]) {
        [CJFileTool removeFileAtPath:messageModel.mediaPath];
    }
}

// current message time
+ (NSInteger)currentMessageTime
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSInteger iTime     = (NSInteger)(time * 1000);
    return iTime;
}

// time format
+ (NSString *)timeFormatWithDate:(NSInteger)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSDate * currentDate = [NSDate dateWithTimeIntervalSince1970:time/1000];
    NSString *date = [formatter stringFromDate:currentDate];
    return date;
}


+ (NSString *)timeFormatWithDate2:(NSInteger)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy/MM/dd HH:mm"];
    NSDate * currentDate = [NSDate dateWithTimeIntervalSince1970:time/1000];
    NSString *date = [formatter stringFromDate:currentDate];
    return date;
    
}

+ (NSDictionary *)fileTypeDictionary
{
    NSDictionary *dic = @{
                          @"mp3":@1,@"mp4":@2,@"mpe":@2,@"docx":@5,
                          @"amr":@1,@"avi":@2,@"wmv":@2,@"xls":@6,
                          @"wav":@1,@"rmvb":@2,@"mkv":@2,@"xlsx":@6,
                          @"mp3":@1,@"rm":@2,@"vob":@2,@"ppt":@7,
                          @"aac":@1,@"asf":@2,@"html":@3,@"pptx":@7,
                          @"wma":@1,@"divx":@2,@"htm":@3,@"png":@8,
                          @"ogg":@1,@"mpg":@2,@"pdf":@4,@"jpg":@8,
                          @"ape":@1,@"mpeg":@2,@"doc":@5,@"jpeg":@8,
                          @"gif":@8,@"bmp":@8,@"tiff":@8,@"svg":@8
                          };
    return dic;
}

+ (NSNumber *)fileType:(NSString *)type
{
    NSDictionary *dic = [self fileTypeDictionary];
    return [dic objectForKey:type];
}

+ (UIImage *)allocationImage:(CJFileType)type
{
    switch (type) {
        case CJFileType_Audio:
            return [UIImage imageNamed:@"yinpin"];
            break;
        case CJFileType_Video:
            return [UIImage imageNamed:@"shipin"];
            break;
        case CJFileType_Html:
            return [UIImage imageNamed:@"html"];
            break;
        case CJFileType_Pdf:
            return  [UIImage imageNamed:@"pdf"];
            break;
        case CJFileType_Doc:
            return  [UIImage imageNamed:@"word"];
            break;
        case CJFileType_Xls:
            return [UIImage imageNamed:@"excerl"];
            break;
        case CJFileType_Ppt:
            return [UIImage imageNamed:@"ppt"];
            break;
        case CJFileType_Img:
            return [UIImage imageNamed:@"zhaopian"];
            break;
        case CJFileType_Txt:
            return [UIImage imageNamed:@"txt"];
            break;
        default:
            return [UIImage imageNamed:@"iconfont-wenjian"];
            break;
    }
}


+ (NSString *)timeDurationFormatter:(NSUInteger)duration
{
    float M = duration/60.0;
    float S = duration - (int)M * 60;
    NSString *timeFormatter = [NSString stringWithFormat:@"%02.0lf:%02.0lf",M,S];
    return  timeFormatter;
    
}





@end
