//
//  CJMessageTopView.h
//  CJchat
//
//  Created by CoderChenJun on 16/4/11.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJMessageTopView : UIView


- (void)messageSendName:(NSString *)name
               isSender:(BOOL)isSender
                   date:(NSInteger)date;


@end
