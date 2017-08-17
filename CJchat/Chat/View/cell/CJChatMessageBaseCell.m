//
//  CJChatMessageBaseCell.m
//  CJchat
//
//  Created by CoderChenJun on 16/3/12.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJChatMessageBaseCell.h"
#import "CJMessageModel.h"
#import "CJMessage.h"
#import "CJMessageTopView.h"

@interface CJChatMessageBaseCell ()


@end

@implementation CJChatMessageBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILongPressGestureRecognizer *longRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressRecognizer:)];
        longRecognizer.minimumPressDuration = 0.5;
        [self addGestureRecognizer:longRecognizer];
    }
    return self;
}

#pragma mark - UI

- (void)setupUI {
    
    [self.contentView addSubview:self.senderNameLabel];
    
    [self.contentView addSubview:self.bubbleView];
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.activityView];
    [self.contentView addSubview:self.retryButton];
}

#pragma mark - Getter and Setter

- (UILabel *)senderNameLabel {
    if (_senderNameLabel == nil) {
        _senderNameLabel = [[UILabel alloc] init];
        _senderNameLabel.font = SenderNameFont;
        _senderNameLabel.textColor = [UIColor lightGrayColor];
    }
    return _senderNameLabel;
}

- (CJHeadImageView *)headImageView {
    if (_headImageView == nil) {
        _headImageView = [[CJHeadImageView alloc] init];
        [_headImageView setColor:CJColor(219, 220, 220) bording:0.0];
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headClicked)];
        [_headImageView addGestureRecognizer:tapGes];
    }
    return _headImageView;
}

- (UIImageView *)bubbleView {
    if (_bubbleView == nil) {
        _bubbleView = [[UIImageView alloc] init];
    }
    return _bubbleView;
}

- (UIActivityIndicatorView *)activityView {
    if (_activityView == nil) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _activityView;
}

- (UIButton *)retryButton {
    if (_retryButton == nil) {
        _retryButton = [[UIButton alloc] init];
        [_retryButton setImage:[UIImage imageNamed:@"button_retry_comment"] forState:UIControlStateNormal];
        [_retryButton addTarget:self action:@selector(retryButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _retryButton;
}

#pragma mark - Respond Method

- (void)retryButtonClick:(UIButton *)btn {
    if ([self.longPressDelegate respondsToSelector:@selector(reSendMessage:)]) {
        [self.longPressDelegate reSendMessage:self];
    }
}

- (void)setModelFrame:(CJMessageFrame *)modelFrame
{
    _modelFrame = modelFrame;
    
     CJMessageModel *messageModel = modelFrame.model;
    self.headImageView.frame     = modelFrame.headImageViewF;
    self.bubbleView.frame        = modelFrame.bubbleViewF;
    
    
    self.senderNameLabel.text = modelFrame.model.message.senderName;
    self.senderNameLabel.frame = modelFrame.senderNameF;
    
    if (messageModel.isSender) {    // 发送者
        self.activityView.frame  = modelFrame.activityF;
        self.retryButton.frame   = modelFrame.retryButtonF;
        switch (modelFrame.model.message.deliveryState) { // 发送状态
            case CJMessageDeliveryState_Delivering:
            {
                [self.activityView setHidden:NO];
                [self.retryButton setHidden:YES];
                [self.activityView startAnimating];
            }
                break;
            case CJMessageDeliveryState_Delivered:
            {
                [self.activityView stopAnimating];
                [self.activityView setHidden:YES];
                [self.retryButton setHidden:YES];
                
            }
                break;
            case CJMessageDeliveryState_Failure:
            {
                [self.activityView stopAnimating];
                [self.activityView setHidden:YES];
                [self.retryButton setHidden:NO];
            }
                break;
            default:
                break;
        }
        if ([modelFrame.model.message.type isEqualToString:TypeFile] ||[modelFrame.model.message.type isEqualToString:TypePicText]) {
            self.bubbleView.image = [UIImage imageNamed:@"liaotianfile"];
        } else {
            self.bubbleView.image = [UIImage resizedImageWithName:@"chat_send_nor"];
        }
        [self.headImageView.imageView setImage:[UIImage imageNamed:@"mayun.jpg"]];
    } else {    // 接收者
        self.retryButton.hidden  = YES;
        self.bubbleView.image    = [UIImage resizedImageWithName:@"chat_recive_nor"];
        [self.headImageView.imageView setImage:[UIImage imageNamed:@"mahuateng.jpeg"]];
    }
}

- (void)headClicked
{
    if ([self.longPressDelegate respondsToSelector:@selector(headImageClicked:)]) {
        [self.longPressDelegate headImageClicked:_modelFrame.model.message.from];
    }
}

#pragma mark - longPress delegate

- (void)longPressRecognizer:(UILongPressGestureRecognizer *)recognizer
{
    if ([self.longPressDelegate respondsToSelector:@selector(longPress:)]) {
        [self.longPressDelegate longPress:recognizer];
    }
}




@end
