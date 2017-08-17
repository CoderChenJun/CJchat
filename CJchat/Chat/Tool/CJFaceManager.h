//
//  CJFaceManager.h
//  CJchat
//
//  Created by CoderChenJun on 16/4/1.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <Foundation/Foundation.h>
@class CJEmotion;

@interface CJFaceManager : NSObject

+ (NSArray *)emojiEmotion;

+ (NSArray *)customEmotion;

+ (NSArray *)gifEmotion;

+ (NSMutableAttributedString *)transferMessageString:(NSString *)message
                                                font:(UIFont *)font
                                          lineHeight:(CGFloat)lineHeight;


@end
