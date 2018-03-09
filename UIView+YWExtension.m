//
//  UIView+YWExtension.m
//  YWCategories
//
//  Created by yaolili on 2018/3/9.
//  Copyright © 2018年 yaolili. All rights reserved.
//

#import "UIView+YWExtension.h"

@implementation UIView (YWExtension)
- (void)yw_viewByRoundCornerRadius:(CGFloat)radius corner:(UIRectCorner)corner{

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}
@end
