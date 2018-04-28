//
//  UIView+YWExtension.m
//  YWCategories
//
//  Created by yaolili on 2018/3/9.
//  Copyright © 2018年 yaolili. All rights reserved.
//

#import "UIView+YWExtension.h"

@implementation UIView (YWExtension)

- (UIImage *)yw_printScreenImage{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    UIImage *resultImage = nil;
    if([self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES]){
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    return resultImage;
}

- (void)yw_viewByRoundCornerRadius:(CGFloat)radius corner:(UIRectCorner)corner{

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}
@end

@implementation UIView (YWFrame)

- (CGFloat)yw_left{
    return self.frame.origin.x;
}

- (void)setYw_left:(CGFloat)yw_left{
    CGRect frame = self.frame;
    frame.origin.x = yw_left;
    self.frame = frame;
}

- (CGFloat)yw_top{
    return self.frame.origin.y;
}

- (void)setYw_top:(CGFloat)yw_top{
    CGRect frame = self.frame;
    frame.origin.y = yw_top;
    self.frame = frame;
}

- (CGFloat)yw_width{
    return self.frame.size.width;
}

 - (void)setYw_width:(CGFloat)yw_width{
     CGRect frame = self.frame;
     frame.size.width = yw_width;
     self.frame = frame;
 }

- (CGFloat)yw_height{
    return self.frame.size.height;
}

- (void)setYw_height:(CGFloat)yw_height{
    CGRect frame = self.frame;
    frame.size.height = yw_height;
    self.frame = frame;
}

- (CGFloat)yw_right{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYw_right:(CGFloat)yw_right{
    CGRect frame = self.frame;
    frame.origin.x = yw_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)yw_bottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYw_bottom:(CGFloat)yw_bottom{
    CGRect frame = self.frame;
    frame.origin.y = yw_bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)yw_centerX{
    return self.center.x;
}

- (void)setYw_centerX:(CGFloat)yw_centerX{
    self.center = CGPointMake(yw_centerX, self.center.y);
}

- (CGFloat)yw_centerY{
    return self.center.y;
}

- (void)setYw_centerY:(CGFloat)yw_centerY{
    self.center = CGPointMake(self.center.x, yw_centerY);
}

- (CGPoint)yw_origin{
    return self.frame.origin;
}

- (void)setYw_origin:(CGPoint)yw_origin{
    CGRect frame = self.frame;
    frame.origin = yw_origin;
    self.frame = frame;
}

- (CGSize)yw_size{
    return self.frame.size;
}

- (void)setYw_size:(CGSize)yw_size{
    CGRect frame = self.frame;
    frame.size = yw_size;
    self.frame = frame;
}

@end
