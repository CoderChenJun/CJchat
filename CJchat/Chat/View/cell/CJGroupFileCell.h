//
//  CJGroupFileCell.h
//  CJchat
//
//  Created by CoderChenJun on 16/8/16.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJBaseMessageCell.h"

@class CJGroupFileCell;

@protocol GroupFileDelegate <NSObject>

- (void)isFileExisted:(CJGroupFileCell *)cell
            isExisted:(BOOL)isExisted
              fileKey:(NSString *)fileKey
             fileName:(NSString *)fileName;

@end

@interface CJGroupFileCell : CJBaseMessageCell


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) CJMessage *message;

@property (nonatomic, weak) id <GroupFileDelegate>delegate;

@property (nonatomic, weak) UIProgressView *progressView;
@property (nonatomic, weak) UIButton *seeBtn;


@end
