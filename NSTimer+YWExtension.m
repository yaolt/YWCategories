//
//  NSTimer+YWExtension.m
//  YWCategories
//
//  Created by coder on 2018/4/8.
//  Copyright © 2018年 coder. All rights reserved.
//

#import "NSTimer+YWExtension.h"

@implementation NSTimer (YWExtension)
+ (NSTimer *)yw_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                         block:(void (^)(NSTimer *timer))block{
    
    return [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(yw_blcokInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)yw_timerWithTimeInterval:(NSTimeInterval)interval
                              repeats:(BOOL)repeats
                                block:(void(^)(NSTimer *timer))block
{
    return [NSTimer timerWithTimeInterval:interval target:self selector:@selector(yw_blcokInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)yw_blcokInvoke:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}
@end
