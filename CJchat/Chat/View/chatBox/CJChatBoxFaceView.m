//
//  CJChatBoxFaceView.m
//  CJchat
//
//  Created by CoderChenJun on 16/3/11.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJChatBoxFaceView.h"
#import "CJChatBoxMenuView.h"
#import "CJEmotionListView.h"
#import "CJFaceManager.h"

#define bottomViewH 36.0

@interface CJChatBoxFaceView ()<UIScrollViewDelegate,CJChatBoxMenuDelegate>

@property (nonatomic, weak) CJEmotionListView *showingListView;

@property (nonatomic, strong) CJEmotionListView *emojiListView;
@property (nonatomic, strong) CJEmotionListView *custumListView;
@property (nonatomic, strong) CJEmotionListView *gifListView;

@property (nonatomic, weak) CJChatBoxMenuView *menuView;

@end

@implementation CJChatBoxFaceView

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        CJChatBoxMenuView *menuView = [[CJChatBoxMenuView alloc] init];
        [menuView setDelegate:self];
        [self addSubview:menuView];
        _menuView = menuView;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            self.custumListView.emotions = [CJFaceManager customEmotion];
        });
        
       // 如果表情选中的时候需要动画或者其它操作,则在这里监听通知
    }
    return self;
}



#pragma mark - Private

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.menuView.width         = self.width;
    self.menuView.height        = bottomViewH;
    self.menuView.x             = 0;
    self.menuView.y             = self.height - self.menuView.height;
    
    self.showingListView.x      = self.showingListView.y = 0;
    self.showingListView.width  = self.width;
    self.showingListView.height = self.menuView.y;
}


#pragma mark - CJChatBoxMenuDelegate

- (void)emotionMenu:(CJChatBoxMenuView *)menu didSelectButton:(CJEmotionMenuButtonType)buttonType
{
    [self.showingListView removeFromSuperview];
    switch (buttonType) {
        case CJEmotionMenuButtonTypeEmoji:
            [self addSubview:self.emojiListView];
            break;
        case CJEmotionMenuButtonTypeCuston:
            [self addSubview:self.custumListView];
            break;
        case CJEmotionMenuButtonTypeGif:
            [self addSubview:self.gifListView];
            break;
        default:
            break;
    }
    self.showingListView = [self.subviews lastObject];
    [self setNeedsLayout];
}


#pragma mark - Getter

- (CJEmotionListView *)emojiListView
{
    if (!_emojiListView) {
        _emojiListView           = [[CJEmotionListView alloc] init];
        _emojiListView.emotions  = [CJFaceManager emojiEmotion];
    }
    return _emojiListView;
}

- (CJEmotionListView *)gifListView
{
    if (!_gifListView) {
        _gifListView             = [[CJEmotionListView alloc] init];
    }
    return _gifListView;
}

- (CJEmotionListView *)custumListView
{
    if (!_custumListView) {
        _custumListView          = [[CJEmotionListView alloc] init];
        _custumListView.emotions = [CJFaceManager customEmotion];
    }
    return _custumListView;
}




@end
