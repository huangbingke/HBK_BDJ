//
//  HBK_BasePresenter.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/6/11.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_BasePresenter.h"

@implementation HBK_BasePresenter


- (instancetype)initWithView:(id)view {
    if (self = [super init]) {
        _view = view;
    }
    return self;
}


- (void)attachView:(id)view {
    _view = view;
}

- (void)detachView {
    _view = nil;
}























@end
