//
//  HBK_HomePresenter.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/6/27.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_HomePresenter.h"

NSString * const kHomeUserInfoCellID = @"kHomeUserInfoCellID";
NSString * const kHomeTextCellID = @"kHomeTextCellID";
NSString * const kHomeImageCellID = @"kHomeImageCellID";
NSString * const kHomeVedioCellID = @"kHomeVedioCellID";
NSString * const kHomeBottomCellID = @"kHomeBottomCellID";


@interface HBK_HomePresenter ()

@property (nonatomic, strong) NSMutableArray <NSMutableArray <HBK_HomeBaseModel *> *> *homeDataArray;
@property (nonatomic, strong)NSString *maxtime;

@end
@implementation HBK_HomePresenter



- (void)refreshDataWithType:(HBK_HomeTableViewType)type {
    [self requestHomeDataWithType:type maxTime:nil];
}

- (void)loadMoreDataType:(HBK_HomeTableViewType)type {
    [self requestHomeDataWithType:type maxTime:self.maxtime];
}

#pragma mark - 网络请求 -
- (void)requestHomeDataWithType:(HBK_HomeTableViewType)type maxTime:(NSString *)maxTime{
    [_view showIndicator];
    NSMutableDictionary *param = [NSMutableDictionary new];
    [param setValue:@"list" forKey:@"a"];
    [param setValue:@"data" forKey:@"c"];
    [param setValue:@(type) forKey:@"type"];
    if (maxTime) {
        [param setValue:maxTime forKey:@"maxtime"];
    }
    [HBK_NetworkManager requestForGetWithUrl:kHomeURL paramter:param success:^(id responseObject) {
        self.maxtime = responseObject[@"info"][@"maxtime"];
        for (NSDictionary *dic in responseObject[@"list"]) {
            [self configureCellForModelWithData:dic];
        }
        [self->_view hideIndicator];
        [self->_view reloadData];
    } failure:^(NSError *error) {
        [self->_view showErrorIndicatorWithInfo:error.localizedDescription];
    }];
}

- (void)configureCellForModelWithData:(NSDictionary *)dic {

    NSMutableArray<HBK_HomeBaseModel *> *modelArray = [NSMutableArray<HBK_HomeBaseModel *> new];
    //添加用户头像姓名信息
    HBK_HomeUserInfoModel *userInfoModel = [[HBK_HomeUserInfoModel alloc] initWithCellHeight:45
                                                                               cellIdentifer:kHomeUserInfoCellID
                                                                                        name:dic[@"name"]
                                                                                     iconUrl:dic[@"profile_image"]
                                                                                  createTime:dic[@"created_at"]];
    [modelArray addObject:userInfoModel];
    
    //有文字就展示文字cell, 没有就不展示
    if ([NSString stringWithFormat:@"%@",dic[@"text"]].length > 0) {
        HBK_HomeTextModel *textModel = [[HBK_HomeTextModel alloc] initWithCellHeight:50
                                                                       cellIdentifer:kHomeTextCellID
                                                                                text:dic[@"text"]];
        [modelArray addObject:textModel];
    }
    
    //判断类型, 根据不通类型, 判断是图片 还是视频
    if ([dic[@"type"] integerValue] == HBK_HomeTableViewTypeImage) {
        HBK_HomeImageModel *picModel = [[HBK_HomeImageModel alloc] initWithCellHeight:100
                                                                        cellIdentifer:kHomeImageCellID
                                                                           imageWidth:[dic[@"width"] floatValue]
                                                                          imageHeight:[dic[@"height"] floatValue]
                                                                                isGif:[dic[@"is_gif"] boolValue]
                                                                        smallImageUrl:dic[@"cdn_img"]];
        [modelArray addObject:picModel];

    } else if ([dic[@"type"] integerValue] == HBK_HomeTableViewTypeVodie) {
        HBK_HomeVedioModel *vedioModel = [[HBK_HomeVedioModel alloc] initWithCellHeight:100
                                                                          cellIdentifer:kHomeVedioCellID
                                                                              playCount:[dic[@"playcount"] integerValue]
                                                                              videotime:[dic[@"videotime"] integerValue]
                                                                             bgImageUrl:dic[@"image_small"]
                                                                             videoWidth:[dic[@"width"] integerValue]
                                                                            videoHeight:[dic[@"height"] integerValue]];
        [modelArray addObject:vedioModel];
    }
    
    //底部 顶踩分享评论等
    HBK_HomeBottomModel *bottomModel = [[HBK_HomeBottomModel alloc] initWithCellHeight:30
                                                                         cellIdentifer:kHomeBottomCellID
                                                                               upCount:[dic[@"ding"] integerValue]
                                                                             downCount:[dic[@"cai"] integerValue]
                                                                           repostCount:[dic[@"repost"] integerValue]
                                                                          commentCount:[dic[@"comment"] integerValue]];
    [modelArray addObject:bottomModel];
    [self.homeDataArray addObject:modelArray];
    
}
#pragma mark - Getter -
- (NSMutableArray<NSMutableArray <HBK_HomeBaseModel *> *> *)homeDataArray {
    if (!_homeDataArray) {
        _homeDataArray = [NSMutableArray<NSMutableArray <HBK_HomeBaseModel *> *> new];
    }
    return _homeDataArray;
}

@end
