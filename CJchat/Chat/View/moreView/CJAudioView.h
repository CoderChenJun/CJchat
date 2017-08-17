//
//  CJAudioView.h
//  CJchat
//
//  Created by CoderChenJun on 16/8/17.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJAudioView : UIView


@property (nonatomic, copy) NSString *audioName;

@property (nonatomic, copy) NSString *audioPath;

- (void)releaseTimer;


@end
