//
//  CJConstants.h
//  CJchat
//
//  Created by CoderChenJun on 16/9/27.
//  Copyright © 2016年 zwu. All rights reserved.
//

#ifndef CJConstants_h
#define CJConstants_h


#define UISCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define UISCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width






#define ALERT(msg)  [[[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:nil \
cancelButtonTitle:@"确定" otherButtonTitles:nil,nil] show]

#define App_RootCtr  [UIApplication sharedApplication].keyWindow.rootViewController

#define CJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define CJHexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]






#define kDiscvoerVideoPath @"Download/Video"  // video子路径
#define kChatVideoPath     @"Chat/Video"      // video子路径
#define kVideoType         @".mp4"            // video类型
#define kRecoderType       @".wav"

#define kChatRecoderPath @"Chat/Recoder"
#define kRecodAmrType @".amr"



#endif /* CJConstants_h */
