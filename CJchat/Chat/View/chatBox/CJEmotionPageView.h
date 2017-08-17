//
//  CJEmotionPageView.h
//  CJchat
//
//  Created by CoderChenJun on 16/4/6.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJEmotion.h"


#define CJEmotionMaxRows 3
#define CJEmotionMaxCols 7
#define CJEmotionPageSize ((CJEmotionMaxRows * CJEmotionMaxCols) - 1)

@interface CJEmotionPageView : UIView

@property (nonatomic, strong) NSArray *emotions;

@end
