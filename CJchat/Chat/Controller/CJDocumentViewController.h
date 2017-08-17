//
//  CJDocumentViewController.h
//  CJchat
//
//  Created by CoderChenJun on 16/3/29.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJDocumentViewController.h"

@protocol ICDocumentDelegate <NSObject>

- (void)selectedFileName:(NSString *)fileName;

@end

@interface CJDocumentViewController : UIViewController

@property (nonatomic, weak) id <ICDocumentDelegate>delegate;

@end
