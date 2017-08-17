//
//  CJTitleView.h
//  CJchat
//
//  Created by CoderChenJun on 16/5/12.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>
@class CJSearchBar;

@protocol CJTitleViewDelegate <NSObject>

- (void)cancelBtnClicked;

- (void)searchText:(NSString *)text;

@end

@interface CJTitleView : UIView

@property (nonatomic, weak) id<CJTitleViewDelegate>delegate;

@end
