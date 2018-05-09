//
//  AppUtils.m
//  YaHao
//
//  Created by mac on 2017/4/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "AppUtils.h"

@implementation AppUtils

+ (CGFloat)countTextHeight:(NSString *)text
                     width:(CGFloat) width
                      font:(CGFloat) fontSize
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 0;
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:options context:nil];
    return rect.size.height;
}


@end
