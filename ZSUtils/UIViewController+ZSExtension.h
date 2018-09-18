//
//  UIViewController+ZSExtension.h
//  ZSUtils
//
//  Created by 張帥 on 2015/5/22.
//  Copyright (c) 2015年 張帥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZSExtension)

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;

- (void)alertViewWithTitle:(NSString *)title
                   content:(NSString *)content
              buttonTitles:(NSArray<NSString *> *)buttonTitles
              buttonBlocks:(NSArray<void (^)(UIAlertAction *action)> *)buttonBlocks;

@end
