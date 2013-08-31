//
//  AppHelper.h
//  Architecture
//
//  Created by 蒲晓涛 on 8/4/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AKTabBarController;

@interface AppDelegateHelper : NSObject

AS_SINGLETON(AppDelegateHelper);

@property(assign, nonatomic)BOOL isFirst;

/**
 *	@brief	启动页加载动画
 *
 *	@param 	mainMindow 	程序主window界面
 */
+ (void)appLaunchingWithAnimation:(UIWindow *)mainMindow;

/**
 *	@brief	TabBarController加载
 *
 *	@return	TabBarController
 */
+(AKTabBarController *)loadTabBarController;


@end
