//
//  CJChatBoxMoreView.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/11.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJChatBoxMoreViewItem.h"

typedef NS_ENUM(NSInteger, CJChatBoxItem){
    CJChatBoxItemAlbum = 0,   // Album
    CJChatBoxItemCamera,      // Camera
    CJChatBoxItemVideo,       // Video
    CJChatBoxItemDoc          // pdf 
};

@class CJChatBoxMoreView;
@protocol CJChatBoxMoreViewDelegate <NSObject>
/**
 *  点击更多的类型
 *
 *  @param chatBoxMoreView CJChatBoxMoreView
 *  @param itemType        类型
 */
- (void)chatBoxMoreView:(CJChatBoxMoreView *)chatBoxMoreView didSelectItem:(CJChatBoxItem)itemType;

@end

@interface CJChatBoxMoreView : UIView

@property (nonatomic, weak) id<CJChatBoxMoreViewDelegate>delegate;
@property (nonatomic, strong) NSMutableArray *items;


@end
