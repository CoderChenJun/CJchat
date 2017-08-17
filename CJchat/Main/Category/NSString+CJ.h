//
//  NSString+CJ.h
//  CJchat
//
//  Created by CoderChenJun on 16/9/27.
//  Copyright © 2016年 zwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CJ)

- (NSString *)emoji;

- (CGSize)sizeWithFont:(UIFont *)font MaxWidth:(CGFloat)width;

- (NSString *)originName;

+ (NSString *)currentTimeString;

- (NSString *)firstStringSeparatedByString:(NSString *)separeted;



@end
