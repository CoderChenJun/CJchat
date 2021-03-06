//
//  CJSearchBar.m
//  CJchat
//
//  Created by CoderChenJun on 16/5/11.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJSearchBar.h"

@implementation CJSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font  = [UIFont systemFontOfSize:13.0];
        self.placeholder = @"搜索";
        self.backgroundColor   = [UIColor whiteColor];
        UIImageView *iconImage = [[UIImageView alloc] init];
        iconImage.image        = [UIImage imageNamed:@"icon--sousuotubiao"];
        iconImage.width        = 30;
        iconImage.height       = 30;
        iconImage.contentMode  = UIViewContentModeCenter;
        self.leftView          = iconImage;
        self.leftViewMode      = UITextFieldViewModeAlways;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius  = 5;
        self.returnKeyType     = UIReturnKeySearch;
    }
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}







@end
