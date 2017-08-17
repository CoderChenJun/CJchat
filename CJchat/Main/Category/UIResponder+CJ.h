//
//  UIResponder+CJ.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/17.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (CJ)

// router message and the responder who you want will respond this method
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
