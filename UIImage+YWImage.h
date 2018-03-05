//
//  UIImage+YWImage.h
//  YWCategories
//
//  Created by coder on 2018/3/3.
//  Copyright © 2018年 coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YWImage)

/**
 将图片重新绘制，改变图片大小
 图片的contentMode默认是UIViewContentModeScaleToFill
 @param size 需要图片生成的新的大小
 @param fillColor 填充颜色
 @param completion 完成回调
 */
- (void)yw_imageByResetSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage * image))completion;


/**
 根据指定的size和contentMode将图片重新绘制

 @param size 需要图片生成的新的大小
 @param fillColor 填充颜色
 @param contentMode 需要指定contentMode
 @param completion 完成回调
 */
- (void)yw_imageByResetSize:(CGSize)size fillColor:(UIColor *)fillColor contentMode:(UIViewContentMode)contentMode completion:(void (^)(UIImage * image))completion;


/**
 生成圆形图片

 @param size 生成图片的大小
 @param fillColor 填充颜色
 @param completion 完成回调
 */
- (void)yw_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *image))completion;
@end
