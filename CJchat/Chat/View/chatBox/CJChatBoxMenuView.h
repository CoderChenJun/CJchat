//
//  CJChatBoxMenuView.h
//  CJchat
//
//  Created by CoderChenJun on 16/4/1.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CJEmotionMenuButtonTypeEmoji = 100,
    CJEmotionMenuButtonTypeCuston,
    CJEmotionMenuButtonTypeGif
    
} CJEmotionMenuButtonType;

@class CJChatBoxMenuView;

@protocol CJChatBoxMenuDelegate <NSObject>

@optional
- (void)emotionMenu:(CJChatBoxMenuView *)menu
    didSelectButton:(CJEmotionMenuButtonType)buttonType;

@end

@interface CJChatBoxMenuView : UIView

@property (nonatomic, weak)id <CJChatBoxMenuDelegate>delegate;

@end
