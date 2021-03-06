//
//  AppDelegate.m
//  Architecture
//
//  Created by 蒲晓涛 on 8/3/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "AKTabBarController.h"
#import "GaryPersonalLog.h"
#import "AppDelegateHelper.h"
#import "CBIntrospect.h"

@implementation AppDelegate

- (void)dealloc
{
    kSafeRelease(_window);
    kSafeRelease(_viewController);
    kSafeRelease(_tabBarController);
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 本人版权日志输出
    [GaryPersonalLog outPutPersonalLog];
    // must be set before any nib is called
    [CBIntrospect setIntrospectorKeyName:@"introspectorName"];

    if ([AppDelegateHelper sharedInstance].isFirst) {
        AppDelegateHelper *ppDelegateHelper = [AppDelegateHelper sharedInstance];
        NSLog(@"%@", (ppDelegateHelper.isFirst) ? @"是" : @"否");
    }

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil] autorelease];
    } else {
        self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil] autorelease];
    }

    self.tabBarController = [AppDelegateHelper loadTabBarController];
    self.window.rootViewController = _tabBarController;

    [_tabBarController release];
    [self.window makeKeyAndVisible];

    // 启动页加载动画,必须放在makeKeyAndVisible之后
    [AppDelegateHelper appLaunchingWithAnimation:_window];

    // UI调试工具加载  在模拟器模式下使用
#ifdef TARGET_IPHONE_SIMULATOR
        [[CBIntrospect sharedIntrospector] start];

        /**
         *   Listen for remote notification messages.
         *   Notifications can be sent from View Introspector, using the Messenger window.
         */
        [[CBIntrospect sharedIntrospector] listenForRemoteNotifications];
#endif

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end