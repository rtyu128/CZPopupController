//
//  CZPopupController.h
//  CZPopupController
//
//  Created by zhangxuming on 16/4/25.
//  Copyright © 2016年 zhangxuming. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CZPopupItem;
@interface CZPopupController : NSObject

@property (nonatomic, assign, readonly, getter=isPopupShowing) BOOL popupShowingFlag;

+ (CZPopupController *)sharedController;

- (void)displayPopup:(CZPopupItem *)popupItem;
- (void)dismissPopup:(CZPopupItem *)popupItem;

@end

NS_ASSUME_NONNULL_END