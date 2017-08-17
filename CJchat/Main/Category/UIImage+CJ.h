//
//  UIImage+CJ.h
//  CJchat
//
//  Created by Chen_Jun on 2017/7/24.
//  Copyright © 2017年 zwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CJ)
/**
 *  返回一张通过最中心点进行拉伸的图片
 *
 *  @param name 原始图片
 *
 *  @return 拉伸结果图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;








+ (UIImage *)imageWithColor:(UIColor *)color;




+ (UIImage *)videoFramerateWithPath:(NSString *)videoPath;

// 压缩图片
+ (UIImage *)simpleImage:(UIImage *)originImg;

+ (UIImage *)makeArrowImageWithSize:(CGSize)imageSize
                              image:(UIImage *)image
                           isSender:(BOOL)isSender;

+ (UIImage *)addImage:(UIImage *)firstImg
              toImage:(UIImage *)secondImg;


@end
