//
//  UIControl+ZSExtension.m
//  ZSUtils
//
//  Created by 張帥 on 2015/5/22.
//  Copyright (c) 2015年 張帥. All rights reserved.
//

#import "UIControl+ZSExtension.h"
#import <objc/runtime.h>

static const char *key = "UICONTROL_ACTION_BLOCK";

@implementation UIControl (ZSExtension)

- (void)handleTapWithBlock:(void (^)(id))block {
    [self handleControlEvents:UIControlEventTouchUpInside withBlock:block];
}

- (void)handleControlEvents:(UIControlEvents)controlEvents withBlock:(void(^)(id sender))block {
    objc_setAssociatedObject(self, &key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(action:) forControlEvents:controlEvents];
}

- (void)action:(id)x {
    self.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.enabled = YES;
    });
    void(^actionBlock)(id sender) = objc_getAssociatedObject(self, &key);
    if (actionBlock) actionBlock(self);
}

@end
