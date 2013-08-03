//
//  APIManage.h
//  Architecture
//
//  Created by 蒲晓涛 on 8/3/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import "RequestAddressManage.h"

/************************************
 *
 *该头文件是用来切换服务器地址所用
 *只需修改ServerAddressNumber 编号即可
 ************************************/


#pragma mark -服务器地址配置

//服务器地址编号   方便切换测试服务器地址
#define ServerAddressNumber 1

//根据服务器地址编号 进行ServerAddress赋值(ServerAddress是服务器地址)
#if (ServerAddressNumber == 1) //正式服务器
    #define ServerAddress  @"http://www.yuecp.com"

#elif (ServerAddressNumber == 2)//测试服务器
    #define ServerAddress  @"http://192.168.1.93"

#endif


#pragma mark -返回整个服务器请求地址

/**
 *	@brief	该方法是返回整个服务器请求地址
 *
 *	@param 	Action_API 	操作API地址
 *
 *	@return	整个服务器请求地址
 */

#define SERVER_API(Action_API) [NSString stringWithFormat:@"%@%@",ServerAddress,Action_API]

