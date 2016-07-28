# CZPopupController
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat-square)](https://github.com/rtyu128/CZPopupController/blob/master/LICENSE)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat-square)](https://www.apple.com/nl/ios/)  
A simple popup display tool for iOS App.  

### Getting Started
  First, import `CZPopupInterface.h` in your implementation file.  
  Second, when you need to popup a view, you can do like this:  
  If the popup is a kind of UIView (except UIWindow):  
  ```objc
  CZView *view = [[CZView allc] initWithFrame:CGRectMake(x, y, width, height)];
  [view displayPopup];
  ```
  Or a kind of UIViewController:  
  ```objc
  UIViewController *viewController = [[UIViewController alloc] init];
  [viewController displayPopup];
  ```
  And then when you need to dismiss the popup, you should tell `CZPopupController` to dismiss the popup:  
  ```objc
  [view dismissPopup];
  [viewController dismissPopup];
  ```
  You can use CocoaPods to gain CZPopupController like this:  
  `pod 'CZPopupController', '~> 0.1.0'`  
  and run `pod update` or `pod install`.
  
  There might be something need to optimize, It's my pleasure to receive any suggestion.  
  Email: zhang_xm15@163.com  

  0.1.0  
  First version of CZPopupController.  

  0.1.1  
  Add parameter to control the interval bewteen popups.  
