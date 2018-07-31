//
//  HBK_BasePresenter.h
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/6/11.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBK_BasePresenter<E> : NSObject {
    __weak E _view;
}

/**
 初始化函数
 */
- (instancetype)initWithView:(E)view;

/**
 绑定视图
 */
- (void)attachView:(E)view;

/**
 解绑视图
 */
- (void)detachView;



@end
