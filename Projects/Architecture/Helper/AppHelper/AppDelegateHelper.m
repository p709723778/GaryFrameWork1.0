//
//  AppHelper.m
//  Architecture
//
//  Created by 蒲晓涛 on 8/4/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import "AppDelegateHelper.h"

@implementation AppDelegateHelper

DEF_SINGLETON(AppDelegateHelper);

-(id)init
{
    if (self = [super init]) {
        _isFirst = [AppDelegateHelper isFirstLaunch];
    }
    return self;
}


/**
 *	@brief	判断App是否第一次启动
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
