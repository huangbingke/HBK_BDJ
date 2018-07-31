//
//  UILabel+Extension.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)color
             textAlignment:(NSTextAlignment)alignment
                      text:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.textAlignment = alignment;
    label.text = text ? text : @"";
    
    return label;
}



+ (CGFloat)labelWidthWithLabelHeigth:(CGFloat)labelHeigth
                                text:(NSString *)text
                                font:(NSInteger)font {
    CGRect labelRect = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, labelHeigth)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                                   context:nil];
    return labelRect.size.width;
}

+ (CGFloat)labelHeightWithLabelWidth:(CGFloat)labelWidth
                                text:(NSString *)text
                                font:(NSInteger)font {
    CGRect labelRect = [text boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                                   context:nil];
    return labelRect.size.height;
}








@end
