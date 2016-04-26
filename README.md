# CZPopupController
  A simple popup display tool for iOS App.

### Getting Started
  First, include `CZPopupInterface.h` in your project.  
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
  There might be something need to optimize, and I'll give example and supply it with Cocoapods later.  
  It's my pleasure to receive any suggestion.  
  Email: zhang_xm15@163.com
