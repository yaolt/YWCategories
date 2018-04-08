//
//  NSTimer+YWExtension.h
//  YWCategories
//
//  Created by coder on 2018/4/8.
//  Copyright © 2018年 coder. All rights reserved.
//
//  参考了YYCategories相关内容

#import <Foundation/Foundation.h>

@interface NSTimer (YWExtension)

/**
 创建NSTimer，自动加入NSRunLoop
 如需改变加入NSRunLoop的模式，可以在外面修改
 
 @param interval 间隔时间
 @param repeats 是否重复
 @param block 需要执行的代码
 @return 创建好的NSTimer
 */
+ (NSTimer *)yw_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                         block:(void(^)(NSTimer *timer))block;


/**
 创建NSTimer，不会自动加入NSRunLoop
 需要在使用的时候自己加入NSRunLoop

 @param interval 时间间隔
 @param repeats 是否重复
 @param block 需要执行的代码
 @return 创建好的NSTimer
 */
+ (NSTimer *)yw_timerWithTimeInterval:(NSTimeInterval)interval
                              repeats:(BOOL)repeats
                                block:(void(^)(NSTimer *timer))block;
@end
