//
//  NSDate+CJ.m
//  CJchat
//
//  Created by CoderChenJun on 16/9/27.
//  Copyright © 2016年 zwu. All rights reserved.
//

#import "NSDate+CJ.h"

@implementation NSDate (CJ)

+ (NSDate *)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond
{
    NSDate *ret = nil;
    double timeInterval = timeIntervalInMilliSecond;
    // judge if the argument is in secconds(for former data structure).
    if(timeIntervalInMilliSecond > 140000000000) {
        timeInterval = timeIntervalInMilliSecond / 1000;
    }
    ret = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return ret;
}

@end
