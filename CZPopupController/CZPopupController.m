//
//  CZPopupController.m
//  CZPopupController
//
//  Created by zhangxuming on 16/4/25.
//  Copyright © 2016年 zhangxuming. All rights reserved.
//

#import "CZPopupController.h"
#import "CZPopupItem.h"

@interface CZPopupController ()

@property (nonatomic, strong) CZPopupItem *foremostPopup;
@property (nonatomic, strong) NSMutableArray<CZPopupItem *> *popups;

@property (nonatomic, strong) UIViewController *containerViewController;
@property (nonatomic, strong) UIWindow *popupBasedWindow;

@end

@implementation CZPopupController

+ (CZPopupController *)sharedController
{
    static CZPopupController *popupController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        popupController = [[CZPopupController alloc] init];
    });
    return popupController;
}


#pragma mark - Public Methods

- (void)displayPopup:(CZPopupItem *)popupItem
{
    if (popupItem.isPopupLegal) {
        [self addPopup:popupItem];
        if (_popups.count == 1) {
            self.foremostPopup = _popups[0];
            [self showForemostPopup];
        }
    } else {
#if defined (DEBUG)
        NSLog(@"%s Error: Illegal popup.", __func__);
#endif
    }
}

- (void)dismissPopup:(CZPopupItem *)popupItem
{
    if (self.isPopupShowing) {
        if (popupItem.popupViewController) {
            [self dismissViewController:popupItem.popupViewController];
        }
    }
}


#pragma mark - Private Methods

- (void)addPopup:(CZPopupItem *)newPopup
{
    if (!_popups) {
        self.popups = [NSMutableArray array];
    }
    
    switch (newPopup.popupLevel) {
        case PopupLevelOrder:
            [self.popups addObject:newPopup];
            break;
            
        case PopupLevelWeak:
            if (_popups.count == 0) {
                [self.popups addObject:newPopup];
            }
            break;
    }
}

- (BOOL)showForemostPopup
{
    if (self.isPopupShowing) {
        return NO;
    }

    // _foremostPopup 不用检查是否为空
    if (_foremostPopup.popupViewController) {
        [self.containerViewController addChildViewController:_foremostPopup.popupViewController];
        [self.containerViewController.view addSubview:_foremostPopup.popupViewController.view];
        [self.foremostPopup.popupViewController didMoveToParentViewController:_containerViewController];
        self.popupBasedWindow.hidden = NO;
        
        if (_foremostPopup.popupCompletion) {
            _foremostPopup.popupCompletion(_foremostPopup.popupViewController, _foremostPopup.popupLevel);
        }
        return YES;
    } else {
        return NO;
    }
}

- (void)dismissViewController:(__kindof UIViewController *)viewController
{
    if (viewController == _foremostPopup.popupViewController && _popups.count > 0) {
        [self.foremostPopup.popupViewController willMoveToParentViewController:nil];
        [self.foremostPopup.popupViewController.view removeFromSuperview];
        [self.foremostPopup.popupViewController removeFromParentViewController];
        [self clean];
        
        if (_foremostPopup) {
            NSTimeInterval interval = _foremostPopup.popupInterval;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self showForemostPopup];
            });
        }
    }
}

- (void)clean
{
    self.popupBasedWindow.hidden = YES;
    self.containerViewController = nil;
    self.popupBasedWindow = nil;
    [self deleteForemostPopupItem];
}

- (void)deleteForemostPopupItem
{
    if (_popups.count > 0) {
        if (_popups.count == 1) {
            self.foremostPopup = nil;
        } else {
            self.foremostPopup = _popups[1];
        }
        [self.popups removeObjectAtIndex:0];
    }

}


#pragma mark - Getter

- (BOOL)isPopupShowing
{
    if (_popupBasedWindow) {
        return !_popupBasedWindow.hidden;
    } else {
        return NO;
    }
}

- (UIViewController *)containerViewController
{
    if (!_containerViewController) {
        _containerViewController = [[UIViewController alloc] init];
        _containerViewController.view.backgroundColor = [UIColor redColor];
    }
    return _containerViewController;
}

- (UIWindow *)popupBasedWindow
{
    if (!_popupBasedWindow) {
        _popupBasedWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _popupBasedWindow.backgroundColor = [UIColor clearColor];
        _popupBasedWindow.windowLevel = UIWindowLevelAlert;
        [_popupBasedWindow setRootViewController:self.containerViewController];
    }
    return _popupBasedWindow;
}

@end