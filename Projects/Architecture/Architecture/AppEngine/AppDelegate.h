//
//  AppDelegate.h
//  Architecture
//
//  Created by 蒲晓涛 on 8/3/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

@class ViewController;
@class AKTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (retain, nonatomic) UIWindow *window;

@property (retain, nonatomic) ViewController *viewController;

@property (retain, nonatomic) AKTabBarController *tabBarController;
@property (retain, nonatomic) UIImageView *splashView;

@end
