//
//  ShorthandMethodManage.h
//  Architecture
//
//  Created by 蒲晓涛 on 8/4/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#ifndef Architecture_ShorthandMethodManage_h
#define Architecture_ShorthandMethodManage_h

#pragma mark - 简写系统中一些方法

#define mAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define mWindow             [[[UIApplication sharedApplication] windows] lastObject]
#define mKeyWindow          [[UIApplication sharedApplication] keyWindow]
#define mUserDefaults       [NSUserDefaults standardUserDefaults]
#define mNotificationCenter [NSNotificationCenter defaultCenter]



#pragma mark - G－C－D

#define kGCDBackground(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define kGCDMain(block)       dispatch_async(dispatch_get_main_queue(),block)


#pragma mark -度弧度转换
#define mDegreesToRadian(x)      (M_PI * (x) / 180.0)
#define mRadianToDegrees(radian) (radian*180.0) / (M_PI)

#endif
