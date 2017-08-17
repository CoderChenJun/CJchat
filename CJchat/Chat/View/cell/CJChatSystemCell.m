//
//  CJChatSystemCell.m
//  CJchat
//
//  Created by CoderChenJun on 16/6/7.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJChatSystemCell.h"
#import "CJMessageFrame.h"
#import "CJMessageModel.h"
#import "CJMessage.h"

#define labelFont [UIFont systemFontOfSize:11.0]

@interface CJChatSystemCell ()

@property (nonatomic, weak) UILabel *contentLabel;

@end

@implementation CJChatSystemCell

+ (instancetype)cellWithTableView:(UITableView *)tableView reusableId:(NSString *)ID
{
    CJChatSystemCell *cell = [[CJChatSystemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *contentLabel = [[UILabel alloc] init];
        [self addSubview:contentLabel];
        self.contentLabel = contentLabel;
        self.backgroundColor           = [UIColor clearColor];
        self.selectionStyle            = UITableViewCellSelectionStyleNone;
        self.contentLabel.backgroundColor = CJHexColor(0xd3d2d2);
        self.contentLabel.textColor       = [UIColor whiteColor];
        self.contentLabel.textAlignment   = NSTextAlignmentCenter;
        self.contentLabel.font            = [UIFont systemFontOfSize:11.0];
        self.contentLabel.layer.masksToBounds  = YES;
        self.contentLabel.layer.cornerRadius   = 4.0;
        self.contentLabel.width = [UIScreen mainScreen].bounds.size.width - 40;
        self.contentLabel.numberOfLines        = 0;
    }
    return self;
}

- (void)setMessageF:(CJMessageFrame *)messageF
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGSize size           = [messageF.model.message.content sizeWithFont:labelFont MaxWidth:[UIScreen mainScreen].bounds.size.width - 40];
    if (size.width > width-40) {
        size.width = width - 40;
    }
    self.contentLabel.height = (int)size.height+3;
    self.contentLabel.width  = (int)size.width+20;// 这个地方不强制转换会有问题
    self.contentLabel.center = CGPointMake(width*0.5, (size.height+10)*0.5);
    
    _messageF            = messageF;
    self.contentLabel.text = messageF.model.message.content;
    
}



- (void)layoutSubviews
{
    [super layoutSubviews];
}


@end
