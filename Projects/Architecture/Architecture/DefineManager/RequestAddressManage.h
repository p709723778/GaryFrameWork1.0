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

//向服务器请求返回格式编号
#define SERVER_RETURN_FORMAT_NUMBER 1

#if (SERVER_RETURN_FORMAT_NUMBER == 1) //返回XML格式的数据
    #define SERVER_RETURN_FORMAT @"XML"

#elif (SERVER_RETURN_FORMAT_NUMBER == 2) //返回JSON格式的数据
    #define SERVER_RETURN_FORMAT @"JSON"
#endif


//操作用户信息钥匙   (比如修改用户信息就必须要此KEY)
#define UserAction_KEY @"995517140540AD97215E439E80F671CC"


//用户登陆
#define USER_LOGING [NSString stringWithFormat:@"/?c=api_user&a=login&Y-KEY=%@&callType=%@",UserAction_KEY,SERVER_RETURN_FORMAT]





#endif
