//
//  HBK_HomePresenter.h
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/6/27.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_BasePresenter.h"
#import "HBK_HomeProtocol.h"
#import "HBK_HomeBaseModel.h"

extern NSString * const kHomeUserInfoCellID;
extern NSString * const kHomeTextCellID;
extern NSString * const kHomeImageCellID;
extern NSString * const kHomeVedioCellID;
extern NSString * const kHomeBottomCellID;

@interface HBK_HomePresenter : HBK_BasePresenter<id<HBK_HomeProtocol>>

/** 首页数据源 */
@property (nonatomic, strong, readonly) NSMutableArray <NSMutableArray <HBK_HomeBaseModel *> *> *homeDataArray;


/** 刷新 */
- (void)refreshDataWithType:(HBK_HomeTableViewType)type;

/** 加载 */
- (void)loadMoreDataType:(HBK_HomeTableViewType)type;









@end
