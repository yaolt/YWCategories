//
//  UIImage+YWImage.m
//  YWCategories
//
//  Created by coder on 2018/3/3.
//  Copyright © 2018年 coder. All rights reserved.
//

#import "UIImage+YWImage.h"
#import <YYWebImage.h>

@implementation UIImage (YWImage)

/**
 根据给定的contentMode重新生成需要绘图的rect
 此方法参考了YYWebImage框架中的方法
 
 @param rect 绘图rect
 @param size 图片size
 @param mode 需要的contentMode
 @return 返回一个处理好的CGRect
 @注意： UIViewContentModeRedraw 和 UIViewContentModeScaleToFill 相同.
 */
static CGRect _YWCGRectFitWithContentMode(CGRect rect, CGSize size, UIViewContentMode mode) {
    rect = CGRectStandardize(rect);
    size.width = size.width < 0 ? -size.width : size.width;
    size.height = size.height < 0 ? -size.height : size.height;
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    switch (mode) {
            case UIViewContentModeScaleAspectFit:
            case UIViewContentModeScaleAspectFill: {
                if (rect.size.width < 0.01 || rect.size.height < 0.01 ||
                    size.width < 0.01 || size.height < 0.01) {
                    rect.origin = center;
                    rect.size = CGSizeZero;
                } else {
                    CGFloat scale;
                    if (mode == UIViewContentModeScaleAspectFit) {
                        if (size.width / size.height < rect.size.width / rect.size.height) {
                            scale = rect.size.height / size.height;
                        } else {
                            scale = rect.size.width / size.width;
                        }
                    } else {
                        if (size.width / size.height < rect.size.width / rect.size.height) {
                            scale = rect.size.width / size.width;
                        } else {
                            scale = rect.size.height / size.height;
                        }
                    }
                    size.width *= scale;
                    size.height *= scale;
                    rect.size = size;
                    rect.origin = CGPointMake(center.x - size.width * 0.5, center.y - size.height * 0.5);
                }
            } break;
            case UIViewContentModeCenter: {
                rect.size = size;
                rect.origin = CGPointMake(center.x - size.width * 0.5, center.y - size.height * 0.5);
            } break;
            case UIViewContentModeTop: {
                rect.origin.x = center.x - size.width * 0.5;
                rect.size = size;
            } break;
            case UIViewContentModeBottom: {
                rect.origin.x = center.x - size.width * 0.5;
                rect.origin.y += rect.size.height - size.height;
                rect.size = size;
            } break;
            case UIViewContentModeLeft: {
                rect.origin.y = center.y - size.height * 0.5;
                rect.size = size;
            } break;
            case UIViewContentModeRight: {
                rect.origin.y = center.y - size.height * 0.5;
                rect.origin.x += rect.size.width - size.width;
                rect.size = size;
            } break;
            case UIViewContentModeTopLeft: {
                rect.size = size;
            } break;
            case UIViewContentModeTopRight: {
                rect.origin.x += rect.size.width - size.width;
                rect.size = size;
            } break;
            case UIViewContentModeBottomLeft: {
                rect.origin.y += rect.size.height - size.height;
                rect.size = size;
            } break;
            case UIViewContentModeBottomRight: {
                rect.origin.x += rect.size.width - size.width;
                rect.origin.y += rect.size.height - size.height;
                rect.size = size;
            } break;
            case UIViewContentModeScaleToFill:
            case UIViewContentModeRedraw:
        default: {
            rect = rect;
        }
    }
    return rect;
}

- (void)yw_imageByResetSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *))completion
{
    [self yw_imageByResetSize:size fillColor:fillColor contentMode:UIViewContentModeScaleToFill completion:completion];
}

- (void)yw_imageByResetSize:(CGSize)size fillColor:(UIColor *)fillColor contentMode:(UIViewContentMode)contentMode completion:(void (^)(UIImage * image))completion{
    //判断给定的size，宽或者高小于等于0，直接返回
    if (size.width <= 0 || size.height <= 0) return;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        CGRect drawRect = _YWCGRectFitWithContentMode(rect, self.size, contentMode);
        if (drawRect.size.width == 0 || drawRect.size.height == 0) return;
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        // 设置填充颜色
        [fillColor setFill];
        UIRectFill(rect);
        [self drawInRect:drawRect];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            if(completion != nil){
                completion(image);
            }
        });
    });
}
- (void)yw_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *image))completion
{
    if (size.width <= 0 || size.height <= 0) return;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        // 设置填充颜色
        [fillColor setFill];
        UIRectFill(rect);
        
        // 利用 UIBezierPath 的 裁切效果
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        [path addClip];
        
        [self drawInRect:rect];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            if(completion != nil){
                completion(image);
            }
        });
    });
}

@end
