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

#pragma mark - ******************frame相关******************
@interface UIView (YWFrame)
/** frame - x*/
@property (nonatomic, assign) CGFloat yw_left;
/** frame - y*/
@property (nonatomic, assign) CGFloat yw_top;
/** frame - width*/
@property (nonatomic, assign) CGFloat yw_width;
/** frame - height*/
@property (nonatomic, assign) CGFloat yw_height;
/** x + w*/
@property (nonatomic, assign) CGFloat yw_right;
/** y + h*/
@property (nonatomic, assign) CGFloat yw_bottom;
/** center - x*/
@property (nonatomic, assign) CGFloat yw_centerX;
/** center - y*/
@property (nonatomic, assign) CGFloat yw_centerY;
/** origin*/
@property (nonatomic, assign) CGPoint yw_origin;
/** size*/
@property (nonatomic, assign) CGSize yw_size;
@end
