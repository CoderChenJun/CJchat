//
//  CJChatSystemCell.h
//  CJchat
//
//  Created by CoderChenJun on 16/6/7.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJChatSystemCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
                       reusableId:(NSString *)ID;

@property (nonatomic, strong) CJMessageFrame *messageF;

@end
