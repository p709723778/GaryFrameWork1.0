//
//  NSString+Category.h
//  Architecture
//
//  Created by 蒲晓涛 on 8/4/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

//int转换
+ (NSString *)integerToString:(int)i;

//float转换
+ (NSString *)floatToString:(float)f;
@end
