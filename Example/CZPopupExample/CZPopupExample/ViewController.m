//
//  ViewController.m
//  CZPopupExample
//
//  Created by Anchor on 16/7/28.
//  Copyright © 2016年 Anchor. All rights reserved.
//

#import "ViewController.h"
#import "CZPopupInterface.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *showButton;
@property (nonatomic, strong) UIView *popupView;
@property (nonatomic, strong) UIView *popupView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    CGFloat width  = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    
    _showButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _showButton.backgroundColor = [UIColor redColor];
    _showButton.frame = CGRectMake((width - 100.0) / 2, (height - 44.0) / 2, 100.0, 44.0);
    _showButton.layer.cornerRadius = 5.0;
    [_showButton setTitle:@"Show" forState:UIControlStateNormal];
    [_showButton addTarget:self
                    action:@selector(showPopupView:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_showButton];
    
    _popupView = [UIView new];
    _popupView.backgroundColor = [UIColor blackColor];
    _popupView.frame = CGRectMake((width - 200)/2, (height - 200)/2, 200, 200);
    _popupView.layer.cornerRadius = 5.0;
    
    UIButton *close1 = [UIButton buttonWithType:UIButtonTypeCustom];
    close1.backgroundColor = [UIColor greenColor];
    close1.frame = CGRectMake(50.0, (200.0 - 44.0) / 2, 100.0, 44.0);
    close1.layer.cornerRadius = 5.0;
    [close1 setTitle:@"Close" forState:UIControlStateNormal];
    [close1 addTarget:self
               action:@selector(close1:)
     forControlEvents:UIControlEventTouchUpInside];
    [_popupView addSubview:close1];
    
    _popupView2 = [UIView new];
    _popupView2.backgroundColor = [UIColor whiteColor];
    _popupView2.frame = CGRectMake((width - 200.0) / 2, (height - 200.0) / 2, 200.0, 200.0);
    _popupView2.layer.cornerRadius = 5.0;
    
    UIButton *close2 = [UIButton buttonWithType:UIButtonTypeCustom];
    close2.backgroundColor = [UIColor greenColor];
    close2.frame = CGRectMake(50.0, (200.0 - 44.0) / 2, 100.0, 44.0);
    close2.layer.cornerRadius = 5.0;
    [close2 setTitle:@"Close" forState:UIControlStateNormal];
    [close2 addTarget:self
               action:@selector(close2:)
     forControlEvents:UIControlEventTouchUpInside];
    [_popupView2 addSubview:close2];
}

- (void)showPopupView:(id)sender
{
    [self.popupView displayPopup];
    [self.popupView2 displayPopupWithLevel:PopupLevelOrder];
}

- (void)close1:(id)sender
{
    [self.popupView dismissPopup];
}

- (void)close2:(id)sender
{
    [self.popupView2 dismissPopup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
