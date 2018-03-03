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
 */
- (UIImage *)yw_imageByResetSize:(CGSize)size;
@end
