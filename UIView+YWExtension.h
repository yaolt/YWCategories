//
//  UIView+YWExtension.h
//  YWCategories
//
//  Created by yaolili on 2018/3/9.
//  Copyright © 2018年 yaolili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YWExtension)
/**
 裁切UIView
 如果裁切半径比View的宽或者高的一半大，根据高或者宽小的一半来裁切
 
 @param radius 裁切半径
 @param corner 裁切哪个角
 */
- (void)yw_viewByRoundCornerRadius:(CGFloat)radius corner:(UIRectCorner)corner;

@end
