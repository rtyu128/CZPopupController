//
//  CZPopupDefine.h
//  CZPopupController
//
//  Created by zhangxuming on 16/4/25.
//  Copyright © 2016年 zhangxuming. All rights reserved.
//

#ifndef CZPopupDefine_h
#define CZPopupDefine_h

typedef NS_ENUM(NSInteger, PopupLevel){
    PopupLevelOrder = 0,  // 弹窗按顺序加入队列 依次显示
    PopupLevelWeak  = 1   // 当且仅当弹窗队列为空时加入队列
};

typedef void (^PopupCompletionBlock)( UIViewController *__nonnull popupViewController, PopupLevel popupLevel);

#endif /* CZPopupDefine_h */
