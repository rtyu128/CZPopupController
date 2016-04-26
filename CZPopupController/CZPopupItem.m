//
//  CZPopupItem.m
//  CZPopupController
//
//  Created by zhangxuming on 16/4/25.
//  Copyright © 2016年 zhangxuming. All rights reserved.
//

#import "CZPopupItem.h"
#import "UIView+Popup.h"
#import "UIViewController+Popup.h"
#import <objc/runtime.h>

@interface CZPopupItem ()

@property (nonatomic, strong) UIView *popupView;

@end

@implementation CZPopupItem

+ (instancetype)itemWithPopupView:(__kindof UIView *)popupView
                       popupLevel:(PopupLevel)popupLevel
                       completion:(PopupCompletionBlock)completion
{
    return [[CZPopupItem alloc] initWithPopupView:popupView
                                       popupLevel:popupLevel completion:completion];
}

+ (instancetype)itemWithPopupViewController:(__kindof UIViewController *)popupViewController
                                 popupLevel:(PopupLevel)popupLevel
                                 completion:(PopupCompletionBlock)completion
{
    return [[CZPopupItem alloc] initWithPopupViewController:popupViewController
                                                 popupLevel:popupLevel completion:completion];
}

- (instancetype)initWithPopupView:(__kindof UIView *)popupView
                       popupLevel:(PopupLevel)popupLevel
                       completion:(PopupCompletionBlock)completion
{
    if (self = [super init]) {
        _popupView = popupView;
        _popupLevel = popupLevel;
        _popupCompletion = [completion copy];
        _popupViewController = [[UIViewController alloc] init];
        _popupViewController.view.backgroundColor = [UIColor clearColor];
        [_popupViewController.view addSubview:popupView];
        _popupLegalFlag = NO;
        if ([self isPopupLevelLegal]) {
            if ([popupView isKindOfClass:[UIView class]] && ![popupView isKindOfClass:[UIWindow class]]) {
                _popupLegalFlag = YES;
            }
        }
    }
    return self;
}

- (instancetype)initWithPopupViewController:(__kindof UIViewController *)popupViewController
                                 popupLevel:(PopupLevel)popupLevel
                                 completion:(PopupCompletionBlock)completion
{
    if (self = [super init]) {
        _popupViewController = popupViewController;
        _popupLevel = popupLevel;
        _popupCompletion = [completion copy];
        if ([self isPopupLevelLegal]) {
            if ([popupViewController isKindOfClass:[UIViewController class]]) {
                _popupLegalFlag = YES;
            }
        }
    }
    return self;
}

- (void)dealloc
{
    if (self.popupView) {
        objc_removeAssociatedObjects(self.popupView);
    } else {
        objc_removeAssociatedObjects(self.popupViewController);
    }
}

- (BOOL)isPopupLevelLegal
{
    if (_popupLevel >= PopupLevelOrder && _popupLevel <= PopupLevelWeak) {
        return YES;
    } else {
        return NO;
    }
}

@end

static void *kPopupUIViewKey = "kPopupUIViewKey";
static void *kPopupUIViewControllerKey = "kPopupUIViewControllerKey";

@implementation UIView (PopupItem)

- (void)setPopupItem:(CZPopupItem *)popupItem
{
    objc_setAssociatedObject(self, kPopupUIViewKey, popupItem, OBJC_ASSOCIATION_ASSIGN);
}

- (CZPopupItem *)popupItem
{
    return  objc_getAssociatedObject(self, kPopupUIViewKey);
}

@end

@implementation UIViewController (PopupItem)

- (void)setPopupItem:(CZPopupItem *)popupItem
{
    objc_setAssociatedObject(self, kPopupUIViewControllerKey, popupItem, OBJC_ASSOCIATION_ASSIGN);
}

- (CZPopupItem *)popupItem
{
    return objc_getAssociatedObject(self, kPopupUIViewControllerKey);
}

@end