//
//  CJChatMessageShareCell.m
//  CJchat
//
//  Created by CoderChenJun on 16/9/8.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJChatMessageShareCell.h"
#import "CJShareButton.h"
#import "CJMessageModel.h"

@interface CJChatMessageShareCell ()

@property (nonatomic, strong) CJShareButton *shareButton;

@end

@implementation CJChatMessageShareCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.shareButton];
    }
    return self;
}



- (void)setModelFrame:(CJMessageFrame *)modelFrame
{
    [super setModelFrame:modelFrame];
    
    self.shareButton.frame = modelFrame.picViewF;
    self.shareButton.messageModel = modelFrame.model;
}

#pragma mark - Event

- (void)shareBtnClicked
{
    [self routerEventWithName:CJRouterEventShareTapEvent
                     userInfo:@{MessageKey   : self.modelFrame,
                                }];
}

#pragma mark - Getter

- (CJShareButton *)shareButton
{
    if (!_shareButton) {
        _shareButton = [CJShareButton buttonWithType:UIButtonTypeCustom];
        [_shareButton addTarget:self action:@selector(shareBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareButton;
}







@end
