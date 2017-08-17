//
//  CJDocumentCell.h
//  CJchat
//
//  Created by CoderChenJun on 16/7/22.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJBaseMessageCell.h"

@protocol CJDocumentCellDelegate <NSObject>

- (void)selectBtnClicked:(id)sender;

@end

@interface CJDocumentCell : CJBaseMessageCell


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *filePath;

@property (nonatomic, weak) id<CJDocumentCellDelegate> delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, weak) UIButton *selectBtn;



@end
