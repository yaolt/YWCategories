//
//  UIImage+YWImage.m
//  test02
//
//  Created by coder on 2018/3/3.
//  Copyright © 2018年 coder. All rights reserved.
//

#import "UIImage+YWImage.h"

@implementation UIImage (YWImage)

- (UIImage *)yw_imageByResetSize:(CGSize)size
{
    // 判断给定的size，宽或者高小于等于0，直接返回nil
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
