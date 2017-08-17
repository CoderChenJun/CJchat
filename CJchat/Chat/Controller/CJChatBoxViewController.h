//
//  CJChatBoxViewController.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/10.
//  Copyright © 2016年 zwu All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJRecordManager.h"
#import "CJChatBoxViewControllerDelegate.h"
#import "CJChatBox.h"

@interface CJChatBoxViewController : UIViewController

@property(nonatomic, weak) id<CJChatBoxViewControllerDelegate>delegate;

@property (nonatomic, strong) CJChatBox *chatBox;

@end
