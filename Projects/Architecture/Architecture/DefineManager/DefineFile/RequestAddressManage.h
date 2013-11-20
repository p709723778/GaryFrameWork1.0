//
//  RequestAddressManage.h
//  Architecture
//
//  Created by 蒲晓涛 on 8/3/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

/****************************
 * 该头文件是用来定义服务器操作API和服务器返回数据格式
 ***************************/


#ifndef Architecture_RequestAddressManage_h
#define Architecture_RequestAddressManage_h

//此处是一个demo

#pragma mark -用户登陆

#define Server_Action_UserLogin [NSString stringWithFormat:@"/?c=api_user&a=login&callType=%@&Y-KEY=%@",SERVER_RETURN_FORMAT, Operate_KEY]


#endif
