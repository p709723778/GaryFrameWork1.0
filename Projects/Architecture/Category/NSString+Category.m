//
//  NSString+Category.m
//  Architecture
//
//  Created by 蒲晓涛 on 8/4/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

#pragma mark - 其他类型转换为NSString

+ (NSString *)integerToString:(int)i
{
    return [NSString stringWithFormat:@"%d",i];
}

+ (NSString *)floatToString:(float)f
{
    return [NSString stringWithFormat:@"%f",f];
}

@end
