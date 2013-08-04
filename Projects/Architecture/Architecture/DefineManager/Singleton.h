//
//  Singleton.h
//  Architecture
//
//  Created by 蒲晓涛 on 8/3/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//


/**
 *	@brief	该头文件是定义单例模式 
 *  在需要声明单例模式的类中使用  AS_SINGLETON(类名)
 */
#ifndef Architecture_Singleton_h

#define Architecture_Singleton_h

#define AS_SINGLETON( __class ) \

#undef	AS_SINGLETON
#define AS_SINGLETON(__class) \
\
static __class *shared##classname = nil; \
\
+ (__class *)shared##Instance \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
} \
\

#endif
