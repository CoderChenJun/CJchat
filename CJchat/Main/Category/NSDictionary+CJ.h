//
//  NSDictionary+CJ.h
//  CJchat
//
//  Created by CoderChenJun on 16/9/27.
//  Copyright © 2016年 zwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CJ)


+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonStr;

- (NSString*)jsonString;

@end
