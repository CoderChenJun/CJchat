//
//  CJEmotion.m
//  CJchat
//
//  Created by CoderChenJun on 16/9/27.
//  Copyright © 2016年 zwu. All rights reserved.
//

#import "CJEmotion.h"

@implementation CJEmotion

- (BOOL)isEqual:(CJEmotion *)emotion
{
    return [self.face_name isEqualToString:emotion.face_name] || [self.code isEqualToString:emotion.code];
}

@end
