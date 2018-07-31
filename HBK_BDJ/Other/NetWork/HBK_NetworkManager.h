//
//  HBK_NetworkManager.h
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBK_NetworkManager : NSObject






/**
 get请求
 @param urlString url
 @param paramter 参数
 @param successed 成功回调
 @param failure 失败回调
 */
+ (void)requestForGetWithUrl:(NSString *)urlString
                    paramter:(id)paramter
                     success:(void (^)(id responseObject))successed
                     failure:(void (^)(NSError *error))failure;














@end
