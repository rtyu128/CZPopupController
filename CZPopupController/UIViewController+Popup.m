//
//  UIViewController+Popup.m
//  CZPopupController
//
//  Created by zhangxuming on 16/4/25.
//  Copyright © 2016年 zhangxuming. All rights reserved.
//

#import "UIViewController+Popup.h"
#import "CZPopupItem.h"
#import "CZPopupController.h"

@implementation UIViewController (Popup)

- (void)displayPopup
{
    [self displayPopupWithLevel:PopupLevelOrder interval:cz_defaultPopupInterval completion:nil];
}

- (void)displayPopupWithLevel:(PopupLevel)level
{
    [self displayPopupWithLevel:level interval:cz_defaultPopupInterval completion:nil];
}

- (void)displayPopupWithLevel:(PopupLevel)level completion:(PopupCompletionBlock)completion
{
    [self displayPopupWithLevel:level interval:cz_defaultPopupInterval completion:completion];
}

- (void)displayPopupWithLevel:(PopupLevel)level
                     interval:(NSTimeInterval)interval
                   completion:(nullable PopupCompletionBlock)completion
{
    if (!self.popupItem) {
        CZPopupItem *item = [CZPopupItem itemWithPopupViewController:self popupLevel:level
                                                            interval:interval completion:completion];
        self.popupItem = item;
        [[CZPopupController sharedController] displayPopup:self.popupItem];
    }
}

- (void)dismissPopup
{
    [[CZPopupController sharedController] dismissPopup:self.popupItem];
}

@end
