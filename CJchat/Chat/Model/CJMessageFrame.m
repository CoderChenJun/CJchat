//
//  CJMessageFrame.m
//  CJchat
//
//  Created by CoderChenJun on 16/3/11.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJMessageFrame.h"
#import "CJMessageModel.h"
#import "NSString+CJ.h"
#import "CJMediaManager.h"

#import "CJMessageConst.h"
#import "CJMessageHelper.h"
#import "CJVideoManager.h"

#define APP_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define APP_HEIGHT ([UIScreen mainScreen].bounds.size.height)



@implementation CJMessageFrame


- (void)setModel:(CJMessageModel *)model
{
    _model = model;
    
    CGFloat headToView    = 10;
    CGFloat headToBubble  = 3;
    CGFloat headWidth     = 45;
    CGFloat cellMargin    = 10;
    CGFloat bubblePadding = 20;
    CGFloat chatLabelMax  = APP_WIDTH - headWidth - 100;
    CGFloat arrowWidth    = 10;      // 气泡箭头
    CGFloat topViewH      = 10;
    CGFloat cellMinW      = 60;     // cell的最小宽度值,针对文本
    
    CGFloat namePadding   = 15;     // 名字 头像 的X间距
    
    CGSize timeSize  = CGSizeMake(0, 0);
    if (model.isSender) {
        cellMinW = timeSize.width + arrowWidth + bubblePadding*2;
        CGFloat headX = APP_WIDTH - headToView - headWidth;
        _headImageViewF = CGRectMake(headX, cellMargin, headWidth, headWidth);
        
        
        // 文字计算的最大尺寸
        CGSize senderMaxSize = CGSizeMake(APP_WIDTH - 2*headWidth-2*headX, MAXFLOAT);
        // 文字内容的尺寸(计算结果)    //model.message.senderName
        CGSize senderRealSize = [model.message.senderName sizeWithFont:SenderNameFont MaxWidth:senderMaxSize.width];
        CGFloat senderW = senderRealSize.width;
        CGFloat senderH = senderRealSize.height;
        CGFloat senderY = cellMargin;
        CGFloat senderX = headX - senderRealSize.width - namePadding;
        _senderNameF = CGRectMake(senderX, senderY, senderW, senderH);
        
        
        if ([model.message.type isEqualToString:TypeText]) { // 文字
            
            CGSize chateLabelSize = [model.message.content sizeWithFont:MessageFont MaxWidth:chatLabelMax];
            CGSize bubbleSize     = CGSizeMake(chateLabelSize.width + bubblePadding * 2 + arrowWidth, chateLabelSize.height + bubblePadding * 2);
            CGSize topViewSize    = CGSizeMake(cellMinW+bubblePadding*2, topViewH);
            _bubbleViewF          = CGRectMake(CGRectGetMinX(_headImageViewF) - headToBubble - bubbleSize.width, cellMargin+topViewH, bubbleSize.width, bubbleSize.height);
            
//            CGFloat x             = CGRectGetMinX(_bubbleViewF)+bubblePadding;
            CGFloat x             = CGRectGetMinX(_bubbleViewF)+(CGRectGetWidth(_bubbleViewF)-chateLabelSize.width)*0.5;
            
            _topViewF             = CGRectMake(CGRectGetMinX(_headImageViewF) - headToBubble - topViewSize.width-headToBubble-5, cellMargin,topViewSize.width,topViewSize.height);
            _chatLabelF           = CGRectMake(x, topViewH + cellMargin + bubblePadding, chateLabelSize.width, chateLabelSize.height);
            
        }
        else if ([model.message.type isEqualToString:TypePic]) { // 图片
            CGSize imageSize = CGSizeMake(40, 40);
            UIImage *image   = [UIImage imageWithContentsOfFile:[[CJMediaManager sharedManager] imagePathWithName:model.mediaPath.lastPathComponent]];
            if (image) {
                imageSize          = [self handleImage:image.size];
            }
            imageSize.width        = imageSize.width > timeSize.width ? imageSize.width : timeSize.width;
            CGSize topViewSize     = CGSizeMake(imageSize.width-arrowWidth, topViewH);
            CGSize bubbleSize      = CGSizeMake(imageSize.width, imageSize.height);
            CGFloat bubbleX        = CGRectGetMinX(_headImageViewF)-headToBubble-bubbleSize.width;
            _bubbleViewF           = CGRectMake(bubbleX, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
            CGFloat x              = CGRectGetMinX(_bubbleViewF);
            _topViewF             = CGRectMake(x, cellMargin,topViewSize.width,topViewSize.height);
            _picViewF              = CGRectMake(x, CGRectGetMaxY(_senderNameF)+headToBubble, imageSize.width, imageSize.height);
        }
        else if ([model.message.type isEqualToString:TypeVoice]) { // 语音消息
            CGFloat bubbleViewW     = 100;
            _bubbleViewF = CGRectMake(CGRectGetMinX(_headImageViewF) - headToBubble - bubbleViewW, cellMargin+topViewH, bubbleViewW, 40);
            _topViewF               = CGRectMake(CGRectGetMinX(_bubbleViewF), cellMargin, bubbleViewW - arrowWidth, topViewH);
            _durationLabelF         = CGRectMake(CGRectGetMinX(_bubbleViewF)+ bubblePadding , cellMargin + 10+topViewH, 50, 20);
            _voiceIconF = CGRectMake(CGRectGetMaxX(_bubbleViewF) - 30, cellMargin + 10 + topViewH, 15, 20);// - 20
        }
        else if ([model.message.type isEqualToString:TypeVideo]) { // 视频信息
            CGSize imageSize       = CGSizeMake(150, 150);
            UIImage *videoImage = [[CJMediaManager sharedManager] videoImageWithFileName:model.mediaPath.lastPathComponent];
            if (!videoImage) {
                NSString *path          = [[CJVideoManager shareManager] receiveVideoPathWithFileKey:[model.mediaPath.lastPathComponent stringByDeletingPathExtension]];
                videoImage    = [UIImage videoFramerateWithPath:path];
            }
            if (videoImage) {
                float scale        = videoImage.size.height/videoImage.size.width;
                imageSize = CGSizeMake(150, 140*scale);
            }
            CGSize bubbleSize = CGSizeMake(imageSize.width, imageSize.height);
            _bubbleViewF = CGRectMake(CGRectGetMinX(_headImageViewF)-headToBubble-bubbleSize.width, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
            CGSize topViewSize     = CGSizeMake(imageSize.width-arrowWidth, topViewH);
            CGFloat x              = CGRectGetMinX(_bubbleViewF);
            _topViewF              = CGRectMake(x, cellMargin, topViewSize.width, topViewSize.height);
            _picViewF              = CGRectMake(x, CGRectGetMaxY(_senderNameF)+headToBubble, imageSize.width, imageSize.height);
        }
        else if ([model.message.type isEqualToString:TypeFile]) {// 文件信息
           CGSize bubbleSize = CGSizeMake(253, 95.0);
            _bubbleViewF = CGRectMake(CGRectGetMinX(_headImageViewF)-headToBubble-bubbleSize.width, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
            CGSize topViewSize     = CGSizeMake(bubbleSize.width-arrowWidth, topViewH);
            CGFloat x              = CGRectGetMinX(_bubbleViewF);
            _topViewF              = CGRectMake(x, cellMargin, topViewSize.width, topViewSize.height);
            _picViewF              = CGRectMake(x, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
        }
        else if ([model.message.type isEqualToString:TypePicText]) {
            CGSize bubbleSize = CGSizeMake(253, 120.0);
            _bubbleViewF = CGRectMake(CGRectGetMinX(_headImageViewF)-headToBubble-bubbleSize.width, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
            CGSize topViewSize     = CGSizeMake(bubbleSize.width-arrowWidth, topViewH);
            CGFloat x              = CGRectGetMinX(_bubbleViewF);
            _topViewF              = CGRectMake(x, cellMargin, topViewSize.width, topViewSize.height);
            _picViewF              = CGRectMake(x, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
        }
        
        CGFloat activityX = _bubbleViewF.origin.x-40;
        CGFloat activityY = (_bubbleViewF.origin.y + _bubbleViewF.size.height)/2 - 5;
        CGFloat activityW = 40;
        CGFloat activityH = 40;
        _activityF        = CGRectMake(activityX, activityY, activityW, activityH);
        _retryButtonF     = _activityF;
        
    } else {    // 接收者
        _headImageViewF   = CGRectMake(headToView, cellMargin, headWidth, headWidth);
        CGSize nameSize       = CGSizeMake(0, 0);
        cellMinW = nameSize.width + 6 + timeSize.width; // 最小宽度
        
        
        
        
        
        // 文字计算的最大尺寸
        CGSize senderMaxSize = CGSizeMake(APP_WIDTH - 2*headWidth-2*headToView, MAXFLOAT);
        // 文字内容的尺寸(计算结果)    //model.message.senderName
        CGSize senderRealSize = [model.message.senderName sizeWithFont:SenderNameFont MaxWidth:senderMaxSize.width];
        CGFloat senderW = senderRealSize.width;
        CGFloat senderH = senderRealSize.height;
        CGFloat senderY = cellMargin;
        CGFloat senderX = CGRectGetMaxX(_headImageViewF) + namePadding;
        _senderNameF = CGRectMake(senderX, senderY, senderW, senderH);
        
        
        
        if ([model.message.type isEqualToString:TypeText]) {
            CGSize chateLabelSize = [model.message.content sizeWithFont:MessageFont MaxWidth:chatLabelMax];
            CGSize topViewSize    = CGSizeMake(cellMinW+bubblePadding*2, topViewH);
            CGSize bubbleSize = CGSizeMake(chateLabelSize.width + bubblePadding * 2 + arrowWidth, chateLabelSize.height + bubblePadding * 2);
            
            _bubbleViewF  = CGRectMake(CGRectGetMaxX(_headImageViewF) + headToBubble, cellMargin+topViewH, bubbleSize.width, bubbleSize.height);
            
//            CGFloat x     = CGRectGetMinX(_bubbleViewF) + bubblePadding + arrowWidth;
            CGFloat x     = CGRectGetMinX(_bubbleViewF)+(CGRectGetWidth(_bubbleViewF)-chateLabelSize.width)*0.5;
            
            _topViewF     = CGRectMake(CGRectGetMinX(_bubbleViewF)+arrowWidth, cellMargin, topViewSize.width, topViewSize.height);
            _chatLabelF   = CGRectMake(x, cellMargin + bubblePadding + topViewH, chateLabelSize.width, chateLabelSize.height);
        }
        else if ([model.message.type isEqualToString:TypePic]) { // 图片消息
            CGSize imageSize = CGSizeMake(40, 40);
            UIImage *image   = [UIImage imageWithContentsOfFile:[[CJMediaManager sharedManager] imagePathWithName:model.mediaPath.lastPathComponent]];
            if (image) {
                imageSize = [self handleImage:image.size];
            }
            imageSize.width        = imageSize.width > cellMinW ? imageSize.width : cellMinW;
            CGSize  topViewSize    = CGSizeMake(imageSize.width-arrowWidth, topViewH);
            CGSize  bubbleSize     = CGSizeMake(imageSize.width, imageSize.height);
            CGFloat bubbleX        = CGRectGetMaxX(_headImageViewF)+headToBubble;
            _bubbleViewF           = CGRectMake(bubbleX, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
            CGFloat x              = CGRectGetMinX(_bubbleViewF);
            _topViewF              = CGRectMake(x+arrowWidth, cellMargin, topViewSize.width, topViewSize.height);
            _picViewF              = CGRectMake(x, CGRectGetMaxY(_senderNameF)+headToBubble, imageSize.width, imageSize.height);

        }
        else if ([model.message.type isEqualToString:TypeVoice]) {    // 语音消息
            CGFloat bubbleViewW = cellMinW + 20; // 加上一个红点的宽度
            CGFloat voiceToBull = 4;
            
            _bubbleViewF = CGRectMake(CGRectGetMaxX(_headImageViewF) + headToBubble, cellMargin+topViewH, bubbleViewW, 40);
            _topViewF    = CGRectMake(CGRectGetMinX(_bubbleViewF)+arrowWidth, cellMargin, bubbleViewW-arrowWidth, topViewH);
             _voiceIconF = CGRectMake(CGRectGetMinX(_bubbleViewF)+arrowWidth+bubblePadding, cellMargin + 10 + topViewH, 15, 20);
            // 假设
            NSString *duraStr = @"100";
            CGSize durSize = [duraStr sizeWithFont:[UIFont systemFontOfSize:14] MaxWidth:chatLabelMax];
            _durationLabelF = CGRectMake(CGRectGetMaxX(_bubbleViewF) - voiceToBull - durSize.width, cellMargin + 10 + topViewH, durSize.width, durSize.height);
            _redViewF = CGRectMake(CGRectGetMaxX(_bubbleViewF) + 6, CGRectGetMinY(_bubbleViewF) + _bubbleViewF.size.height*0.5-4, 8, 8);
        }
        else if ([model.message.type isEqualToString:TypeVideo]) {   // 视频
            CGSize imageSize       = CGSizeMake(150, 150);
            UIImage *videoImage = [[CJMediaManager sharedManager] videoImageWithFileName:[NSString stringWithFormat:@"%@.png",model.message.fileKey]];
            if (!videoImage) {
                NSString *path          = [[CJVideoManager shareManager] receiveVideoPathWithFileKey:model.message.fileKey];
                videoImage    = [UIImage videoFramerateWithPath:path];
            }
            if (videoImage) {
                float scale        = videoImage.size.height/videoImage.size.width;
                imageSize = CGSizeMake(150, 140*scale);
            }
            CGSize bubbleSize = CGSizeMake(imageSize.width, imageSize.height+topViewH);
            _bubbleViewF = CGRectMake(CGRectGetMaxX(_headImageViewF)+headToBubble, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
            CGSize topViewSize     = CGSizeMake(imageSize.width-arrowWidth, topViewH);
            CGFloat x              = CGRectGetMinX(_bubbleViewF);
            _topViewF              = CGRectMake(x+arrowWidth, cellMargin, topViewSize.width, topViewSize.height);
            _picViewF              = CGRectMake(x, CGRectGetMaxY(_senderNameF)+headToBubble, imageSize.width, imageSize.height);
        }
        else if ([model.message.type isEqualToString:TypeSystem]) {
            CGSize size           = [model.message.content sizeWithFont:[UIFont systemFontOfSize:11.0] MaxWidth:APP_WIDTH-40];
            _bubbleViewF = CGRectMake(0, 0, 0, size.height+10);// 只需要高度就行
        }
        else if ([model.message.type isEqualToString:TypeFile]) {
            CGSize bubbleSize = CGSizeMake(253, 95.0);
            _bubbleViewF = CGRectMake(CGRectGetMaxX(_headImageViewF)+headToBubble, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
            CGSize topViewSize     = CGSizeMake(bubbleSize.width-arrowWidth, topViewH);
            CGFloat x              = CGRectGetMinX(_bubbleViewF);
            _topViewF              = CGRectMake(x+arrowWidth, cellMargin, topViewSize.width, topViewSize.height);
            _picViewF              = CGRectMake(x, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
        }
        else if ([model.message.type isEqualToString:TypePicText]) {
            CGSize bubbleSize = CGSizeMake(253, 120.0);
            _bubbleViewF = CGRectMake(CGRectGetMaxX(_headImageViewF)+headToBubble, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
            CGSize topViewSize     = CGSizeMake(bubbleSize.width-arrowWidth, topViewH);
            CGFloat x              = CGRectGetMinX(_bubbleViewF);
            _topViewF              = CGRectMake(x+arrowWidth, cellMargin, topViewSize.width, topViewSize.height);
            _picViewF              = CGRectMake(x, CGRectGetMaxY(_senderNameF)+headToBubble, bubbleSize.width, bubbleSize.height);
        }
        
    }
    _cellHight = MAX(CGRectGetMaxY(_bubbleViewF), CGRectGetMaxY(_headImageViewF)) + cellMargin;
    if ([model.message.type isEqualToString:TypeSystem]) {
        CGSize size           = [model.message.content sizeWithFont:[UIFont systemFontOfSize:11.0] MaxWidth:[UIScreen mainScreen].bounds.size.width-40];
        _cellHight = size.height+10;
    }
}


    
// 缩放，临时的方法
- (CGSize)handleImage:(CGSize)retSize
{
    CGFloat scaleH = 0.22;
    CGFloat scaleW = 0.38;
    CGFloat height = 0;
    CGFloat width = 0;
    if (retSize.height / APP_HEIGHT + 0.16 > retSize.width / APP_WIDTH) {
        height = APP_HEIGHT * scaleH;
        width = retSize.width / retSize.height * height;
    } else {
        width = APP_WIDTH * scaleW;
        height = retSize.height / retSize.width * width;
    }
    return CGSizeMake(width, height);
}







@end
