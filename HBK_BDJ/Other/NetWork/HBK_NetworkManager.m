//
//  HBK_NetworkManager.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_NetworkManager.h"

@implementation HBK_NetworkManager


+ (void)requestForGetWithUrl:(NSString *)urlString
                    paramter:(id)paramter
                     success:(void (^)(id responseObject))successed
                     failure:(void (^)(NSError *error))failure {
    NSMutableString *mutableUrl = [[NSMutableString alloc] initWithString:urlString];
    if ([paramter allKeys]) {
        [mutableUrl appendString:@"?"];
        for (id key in paramter) {
            NSString *value = [paramter objectForKey:key];
            [mutableUrl appendString:[NSString stringWithFormat:@"%@=%@&", key, value]];
        }
    }
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:mutableUrl]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        kMyLog(@"\n\n请求结果 \n\n data:\n%@\n\n response:\n%@\n\n error:%@", data, response, error);
        if (error) {
//            kMyLog(@"请求失败: %@", error);
            failure(error);
        } else {
            id result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
//            kMyLog(@"请求成功: %@", result);
            successed(result);
        }
    }];
    [dataTask resume];
}













@end
