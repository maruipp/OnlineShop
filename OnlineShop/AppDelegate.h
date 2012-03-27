//
//  AppDelegate.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-27.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootTabBarController.h"
#import "ShouYeController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootTabBarController     * rootTabBarController;
- (void)initTabBarController;
- (void)addNotificationToCenter;

- (void)initProgressHD;
- (void)hiddenProgress;
@end
