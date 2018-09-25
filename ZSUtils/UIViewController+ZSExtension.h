//
//  UIViewController+ZSExtension.h
//  ZSUtils
//
//  Created by 張帥 on 2015/5/22.
//  Copyright (c) 2015年 張帥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZSExtension)
@property (nonatomic, strong, nullable) UIView *titleView;
@property (nonatomic, strong, nullable) UIBarButtonItem *leftBarButtonItem;
@property (nonatomic, strong, nullable) UIBarButtonItem *rightBarButtonItem;

- (void)alertViewWithTitle:(NSString * _Nullable)title
                   content:(NSString * _Nullable)content
              buttonTitles:(NSArray<NSString *> *_Nonnull )buttonTitles
             buttonActions:(void (^_Nullable)(NSInteger btnIndex))buttonActions;

- (void)actionSheetWithTitle:(NSString * _Nullable)title
                     content:(NSString * _Nullable)content
                buttonTitles:(NSArray<NSString *> *_Nonnull )buttonTitles
               buttonActions:(void (^_Nullable)(NSInteger btnIndex))buttonActions;

@end
