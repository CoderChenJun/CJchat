//
//  CJChatBoxMoreViewItem.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/14.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJChatBoxMoreViewItem : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageName;


- (void)addTarget:(id)target action:(SEL)action
                   forControlEvents:(UIControlEvents)controlEvents;

/**
 *  创建一个CJChatBoxMoreViewItem
 *
 *  @param title     item的标题
 *  @param imageName item的图片
 *
 *  @return item
 */
+ (CJChatBoxMoreViewItem *)createChatBoxMoreItemWithTitle:(NSString *)title
                                                imageName:(NSString *)imageName;

@end
