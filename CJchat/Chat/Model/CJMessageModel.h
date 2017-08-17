//
//  CJMessageModel.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/12.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJMessage.h"

@interface CJMessageModel : NSObject

// 后期重构把这个类可能要去掉--by:gxz

// 是否是发送者
@property (nonatomic, assign) BOOL isSender;
// 是否是群聊
//@property (nonatomic, assign) BOOL isChatGroup;


@property (nonatomic, strong) CJMessage *message;

// 包含voice，picture，video的路径;有大图时就是大图路径
// 不用这些路径了，只用里面的名字重新组成路径
@property (nonatomic, copy) NSString *mediaPath;


@end
