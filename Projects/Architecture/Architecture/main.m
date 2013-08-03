//
//  main.m
//  Architecture
//
//  Created by 蒲晓涛 on 8/3/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSLog(@"%@",SERVER_API(USER_LOGING));
        
        NSLog(@"%d",IOS6_OR_LATER);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
