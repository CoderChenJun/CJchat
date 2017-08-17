//
//  CJChatMessageSyeCell.h
//  CJchat
//
//  Created by CoderChenJun on 16/4/29.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>
@class CJMessageFrame;

@interface CJChatMessageSyeCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
                       reusableId:(NSString *)ID;

@property (nonatomic, strong) CJMessageFrame *messageF;

@end
