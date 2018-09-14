//
//  UIView+ZSExtension.m
//  ZSUtils
//
//  Created by 張帥 on 2015/5/22.
//  Copyright (c) 2015年 張帥. All rights reserved.
//

#import "UIView+ZSExtension.h"
#import <objc/runtime.h>

static const char* IndexPathKey ="UIView_UserInfo";

@implementation UIView (ZSExtension)

+ (instancetype)viewWithColor:(UIColor *)color {
    UIView *view = [[self alloc] init];
    view.backgroundColor = color;
    return view;
}

- (void)setUserInfo:(NSIndexPath *)userInfo {
    objc_setAssociatedObject(self, &IndexPathKey, userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)userInfo {
    return (id)objc_getAssociatedObject(self,IndexPathKey);
}

- (void)setFilletRadius:(CGFloat)filletRadius {
    self.layer.cornerRadius = filletRadius;
    self.clipsToBounds = YES;
}

- (CGFloat)filletRadius {
    return self.layer.cornerRadius;
}

- (void)clearAllSubView {
    for (UIView *subView in [self subviews]) {
        if ([[subView subviews] count] > 0) {
            for (UIView *s in [subView subviews]) {
                [s clearAllSubView];
            }
        }
        [subView removeFromSuperview];
    }
}
- (NSArray *)allSubViews {
    NSMutableArray *items = [NSMutableArray array];
    for (UIView *v in [self subviews]) {
        [items addObject:v];
        if ([[v subviews] count] > 0) {
            [items addObjectsFromArray:[v allSubViews]];
        }
    }
    return [NSArray arrayWithArray:items];
}

- (void)resignResponder {
    if ([self isKindOfClass:[UITextField class]]) {
        [(UITextField *)self resignFirstResponder];
    }
    if ([self isKindOfClass:[UITextView class]]) {
        [(UITextView *)self resignFirstResponder];
    }
    if ([[self subviews] count] > 0) {
        for (UIView *v in [self subviews]) {
            [v resignResponder];
        }
    }
}

-(void)setHeight:(CGFloat)height {
    CGRect rect = [self frame];
    rect.size.height = height;
    [self setFrame:rect];
}
-(CGFloat)height {
    return self.frame.size.height;
}
-(void)setWidth:(CGFloat)width {
    CGRect rect = [self frame];
    rect.size.width = width;
    [self setFrame:rect];
}
-(CGFloat)width {
    return self.frame.size.width;
}
-(void)setX:(CGFloat)x {
    CGRect rect = [self frame];
    rect.origin.x = x;
    [self setFrame:rect];
}
-(CGFloat)X {
    return self.frame.origin.x;
}
-(void)setY:(CGFloat)y {
    CGRect rect = [self frame];
    rect.origin.y = y;
    [self setFrame:rect];
}
-(CGFloat)Y {
    return self.frame.origin.y;
}

@end
