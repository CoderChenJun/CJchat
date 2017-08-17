//
//  UIResponder+CJ.m
//  CJchat
//
//  Created by CoderChenJun on 16/3/17.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "UIResponder+CJ.h"

@implementation UIResponder (CJ)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

@end
