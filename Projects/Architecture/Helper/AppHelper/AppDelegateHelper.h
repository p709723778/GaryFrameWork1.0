//
//  AppHelper.h
//  Architecture
//
//  Created by 蒲晓涛 on 8/4/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDelegateHelper : NSObject

AS_SINGLETON(AppDelegateHelper);

@property(assign, nonatomic)BOOL isFirst;

@end
