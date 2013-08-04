//
//  UIButton+Category.m
//  Architecture
//
//  Created by 蒲晓涛 on 8/4/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import "UIButton+Category.h"
#import "SoundManager.h"

@implementation UIButton (Category)

//点击按钮通用声音 重写了点击结束事件  然后调用基类事件
//此处要注意  caf格式的声音文件只传文件名即可,无需后缀名,其他格式的要带后缀名
//此处扩展的话  可以自定义声音  还有iPad兼容不同声音,后续需要改

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[SoundManager sharedManager] playSound:@"tap.aif" looping:NO];
    [super touchesEnded:touches withEvent:event];
}

@end
