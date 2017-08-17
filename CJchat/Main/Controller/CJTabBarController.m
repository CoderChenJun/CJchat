//
//  CJTabBarController.m
//  CJchat
//
//  Created by CoderChenJun on 16/9/27.
//  Copyright © 2016年 zwu. All rights reserved.
//

#import "CJTabBarController.h"
//#import "XZMineViewController.h"
//#import "XZMessageViewController.h"
//#import "XZContactViewController.h"
//#import "XZDiscoverViewController.h"

#import "CJNavigationController.h"

@interface CJTabBarController ()

@end

@implementation CJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    XZMessageViewController *messageVc = [[XZMessageViewController alloc] init];
//    [self addChildVc:messageVc title:@"微信" image:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL"];
//    
//    XZContactViewController *contactsVc = [[XZContactViewController alloc] init];
//    [self addChildVc:contactsVc title:@"通讯录" image:@"tabbar_contacts" selectedImage:@"tabbar_contactsHL"];
//    
//    XZDiscoverViewController *applicationVc = [[XZDiscoverViewController alloc] init];
//    [self addChildVc:applicationVc title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discoverHL"];
//    
//    XZMineViewController *mineVc = [[XZMineViewController alloc] init];
//    [self addChildVc:mineVc title:@"我" image:@"tabbar_me" selectedImage:@"tabbar_meHL"];
    
    [self setupTabBar];
    
}


- (void)setupTabBar
{
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:bgView atIndex:0];
    self.tabBar.opaque = YES;
}


- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = CJColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = CJColor(26, 178, 10);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    CJNavigationController *nav = [[CJNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    
}





@end
