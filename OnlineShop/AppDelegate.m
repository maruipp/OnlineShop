//
//  AppDelegate.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-27.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize rootTabBarController = _rootTabBarController;
- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark - init table bar controller
- (void)initTabBarController
{
    ShouYeController * shouYeCtr = [[[ShouYeController alloc] initWithNibName:nil bundle:nil] autorelease];
    UINavigationController * shouYeNvg = [[[UINavigationController alloc] initWithRootViewController:shouYeCtr] autorelease];
//    ZKCompanyCenterController * companyCtr = [[[ZKCompanyCenterController alloc] initWithNibName:nil bundle:nil] autorelease];
//    ZKOrderCenterController * orderCtr =[[[ZKOrderCenterController alloc] initWithNibName:nil bundle:nil] autorelease];
//    ZKRewardController * rewardCtr = [[[ZKRewardController alloc] initWithNibName:nil bundle:nil] autorelease];
//    ZKAccountCenterController * accountCtr = [[[ZKAccountCenterController alloc] initWithNibName:nil bundle:nil] autorelease];
    
    NSArray* controllers = [NSArray arrayWithObjects:
                            shouYeNvg, 
                            shouYeNvg,
                            shouYeNvg,
                            shouYeNvg,
                            shouYeNvg, 
                            nil];
    _rootTabBarController = [[RootTabBarController alloc] init];
    _rootTabBarController.viewControllers = controllers;
    
    
    _rootTabBarController.selectedIndex = 0;
    [self.window addSubview:_rootTabBarController.view];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self addNotificationToCenter];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self initTabBarController];
    return YES;
}

#pragma mark - init notification center
- (void) addNotificationToCenter
{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(successLogin) name:NOTIFICATION_LOGIN_SUCCESS object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabBar) name:NOTIFICATION_SHOW_TABBAR object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideTabBar) name:NOTIFICATION_HIDE_TABBAR object:nil];
}

#pragma mark - manage tabbar
- (void) hideTabBar{
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in _rootTabBarController.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, 480, view.frame.size.width, view.frame.size.height)];
        } 
        else 
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480)];
        }
        
    }
    
    [UIView commitAnimations];
    
}

- (void) showTabBar{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in _rootTabBarController.view.subviews)
    {
        NSLog(@"%@", view);
        
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, 431, view.frame.size.width, view.frame.size.height)];
            
        } 
        else 
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 431)];
        }
        
        
    }
    
    [UIView commitAnimations]; 
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
