//
//  GaryPersonalLog.m
//  Architecture
//
//  Created by 蒲晓涛 on 8/3/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import "GaryPersonalLog.h"
#import "DefineFileManager.h"

/**
 *	@brief	个人框架版本
 */
#define GARY_VERSION		@"1.0.0 β"


@implementation GaryPersonalLog

+ (void)outPutPersonalLog
{
    
/**
 *	@brief	判断是否为 iPhone设备 或者 模拟器
 *
 *	@param 	TARGET_IPHONE_SIMULATOR 	模拟器
 *
 *	@param 	TARGET_OS_IPHONE 	        iPhone真机设备
 *
 *	@return	YES Or NO
 */
    
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

    
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "          ╭━━╮╭━━╮╭━━╮╭╮╭╮  \n" );
    fprintf( stderr, "          ┃╭━╯┃╭╮┃┃╭╮┃┃╰╯┃  \n" );
    fprintf( stderr, "          ┃┃╭╮┃╰╯┃┃╰╯┃╰╮╭╯  \n" );
    fprintf( stderr, "          ┃┃┃┃┃╭╮┃┃╭╭╯ ┃┃   \n" );
    fprintf( stderr, "          ┃╰╯┃┃┃┃┃┃┃╰╮ ┃┃   \n" );
    fprintf( stderr, "          ╰━━╯╰╯╰╯╰╯╰╯ ╰╯   \n" );
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "    	copyright (c) 2013-2014, {Gary} people	\n" );
    fprintf( stderr, "    	http://blog.sina.com.cn/p709723778		\n" );
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "    	version %s									\n", [GARY_VERSION UTF8String] );
    fprintf( stderr, "    	当前系统语言%s	\n", [UIDevice OSLanguage].UTF8String );
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "      越狱信息 	%s	\n", [UIDevice jailBreaker].UTF8String );
    fprintf( stderr, "    	%s	\n", [UIDevice OSVersion].UTF8String );
    fprintf( stderr, "    	%s	\n", [UIDevice deviceModel].UTF8String );
    fprintf( stderr, "    	UUID: %s  \n", [UIDevice deviceUUID].UTF8String );
    fprintf( stderr, "    	Home: %s	\n", [NSBundle mainBundle].bundlePath.UTF8String );
    fprintf( stderr, "    												\n" );
    fprintf( stderr, "    												\n" );
    
#endif
    
}

@end
