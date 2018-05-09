//
//  AppUtils.h
//  YaHao
//
//  Created by mac on 2017/4/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppUtils : NSObject

/**
 计算固定宽度的文本显示高度
 
 @param text 文本
 @param width 显示宽度
 @param fontSize 显示字体
 @return 文本显示高度
 */
+ (CGFloat)countTextHeight:(NSString *)text
                     width:(CGFloat) width
                      font:(CGFloat) fontSize;



@end
