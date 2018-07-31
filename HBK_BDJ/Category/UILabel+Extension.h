//
//  UILabel+Extension.h
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)color
             textAlignment:(NSTextAlignment)alignment
                      text:(NSString *)text;

/** 宽度固定 算高 */
+ (CGFloat)labelHeightWithLabelWidth:(CGFloat)labelWidth
                                text:(NSString *)text
                                font:(NSInteger)font;


/** 高度固定算宽 */
+ (CGFloat)labelWidthWithLabelHeigth:(CGFloat)labelHeigth
                                text:(NSString *)text
                                font:(NSInteger)font;

@end
