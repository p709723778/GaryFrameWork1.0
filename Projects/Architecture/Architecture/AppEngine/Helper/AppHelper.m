//
//  AppHelper.m
//  Architecture
//
//  Created by 蒲晓涛 on 8/4/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper


/**
 *	@brief	判断应用是否第一次启动
 *  
 *	@return	YES Or NO
 */
+ (BOOL)isFirstLaunch
{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"];
}
@end
