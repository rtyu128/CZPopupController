//
//  CZPopupItem.h
//  CZPopupController
//
//  Created by zhangxuming on 16/4/25.
//  Copyright © 2016年 zhangxuming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZPopupDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface CZPopupItem : NSObject

@property (nonatomic, strong, readonly) UIViewController *popupViewController;
@property (nonatomic, assign, readonly) PopupLevel popupLevel;
@property (nonatomic, assign, readonly, getter=isPopupLegal) BOOL popupLegalFlag;
@property (nonatomic, copy, readonly, nullable) PopupCompletionBlock popupCompletion;

+ (instancetype)itemWithPopupView:(__kindof UIView *)popupView
                       popupLevel:(PopupLevel)popupLevel
                       completion:(nullable PopupCompletionBlock)completion;

+ (instancetype)itemWithPopupViewController:(__kindof UIViewController *)popupViewController
                                 popupLevel:(PopupLevel)popupLevel
                                 completion:(nullable PopupCompletionBlock)completion;

@end

@interface UIView (PopupItem)

@property (nonatomic, weak, nullable) CZPopupItem *popupItem;

@end

@interface  UIViewController (PopupItem)

@property (nonatomic, weak, nullable) CZPopupItem *popupItem;

@end

NS_ASSUME_NONNULL_END
