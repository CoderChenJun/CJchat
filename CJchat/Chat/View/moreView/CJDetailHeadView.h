//
//  CJDetailHeadView.h
//  CJchat
//
//  Created by CoderChenJun on 16/4/21.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat ICTopImageH =  150;

@protocol ICDetailHeadDelegate <NSObject>

- (void)deleteBtnClicked;
- (void)addBtnClicked;
- (void)headBtnClicked:(NSInteger)index;
- (void)changeGroupName;
- (void)changeGroupHeadImg;

@end

@interface CJDetailHeadView : UIView

@property (nonatomic, weak) id<ICDetailHeadDelegate>headDelegate;
@property (nonatomic, strong) NSArray *users;

@property (nonatomic, assign) BOOL isMaster;
@property (nonatomic, strong) CJGroup *group;

@property (nonatomic, strong) UIView *topView;

@end
