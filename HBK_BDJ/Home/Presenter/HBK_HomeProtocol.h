//
//  HBK_HomeProtocol.h
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/6/27.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HBK_HomeProtocol <NSObject>


@optional;
- (void)showIndicator;
- (void)showIndicatorWithInfo:(NSString *)infoString;
- (void)showErrorIndicatorWithInfo:(NSString *)infoString;
- (void)hideIndicator;
- (void)reloadData;











@end
