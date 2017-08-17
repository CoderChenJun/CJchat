//
//  CJChatForwardCell.h
//  CJchat
//
//  Created by CoderChenJun on 16/7/15.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJBaseMessageCell.h"
@class CJGroup;

@interface CJChatForwardCell : CJBaseMessageCell

@property (nonatomic, strong) CJGroup *group;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
