//
//  CJNavigationController.m
//  CJchat
//
//  Created by CoderChenJun on 16/9/27.
//  Copyright © 2016年 zwu. All rights reserved.
//

#import "CJNavigationController.h"

@interface CJNavigationController ()

@end

@implementation CJNavigationController

+ (void)initialize
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15.0];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:CJColor(43, 45, 40)] forBarMetrics:UIBarMetricsDefault];
    
    
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
