//
//  HBK_HomeBaseModel.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_HomeBaseModel.h"

@implementation HBK_HomeBaseModel


- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer {
    if (self = [super init]) {
        self.cellHeight = cellHeight;
        self.cellIdentifier = cellIdentifer;
    }
    return self;
}



@end

@implementation HBK_HomeUserInfoModel

- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer
                              name:(NSString *)name
                           iconUrl:(NSString *)iconUrl
                        createTime:(NSString *)createTime {
    if (self = [super initWithCellHeight:cellHeight cellIdentifer:cellIdentifer]) {
        self.name = name;
        self.profile_image = iconUrl;
        self.created_at = createTime;
    }
    return self;
}



@end



@implementation HBK_HomeTextModel


- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer
                              text:(NSString *)text {
    if (self = [super initWithCellHeight:cellHeight cellIdentifer:cellIdentifer]) {
        self.text = text;
    }
    return self;
}

- (CGFloat)cellHeight {
    CGFloat cellHeight = [UILabel labelHeightWithLabelWidth:kScreenWidth-10 text:self.text font:15] + 11;
    return cellHeight;
}

@end


@implementation HBK_HomeImageModel

- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer
                        imageWidth:(CGFloat)imageWidth
                       imageHeight:(CGFloat)imageHeight
                             isGif:(BOOL)isGif
                     smallImageUrl:(NSString *)smallImageUrl {
    if (self = [super initWithCellHeight:cellHeight cellIdentifer:cellIdentifer]) {
        self.width = imageWidth;
        self.height = imageHeight;
        self.is_gif = isGif;
        self.image_small = smallImageUrl;
    }
    return self;
}


- (CGFloat)cellHeight {
    if ((self.height / self.width * (kScreenWidth-10) + 10) > kScreenHeight) {
        self.isBigPic = YES;
        return 210;
    } else {
        self.isBigPic = NO;
        return self.height / self.width * (kScreenWidth-10) + 10;
    }
}



@end




@implementation HBK_HomeVedioModel


- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer
                         playCount:(NSInteger)playCount
                         videotime:(NSInteger)videoTime
                        bgImageUrl:(NSString *)bgImageUrl
                        videoWidth:(CGFloat)videoWidth
                       videoHeight:(CGFloat)videoHeight{
    if (self = [super initWithCellHeight:cellHeight cellIdentifer:cellIdentifer]) {
        self.videotime = videoTime;
        self.playcount = playCount;
        self.image_small = bgImageUrl;
        self.width = videoWidth;
        self.height = videoHeight;
    }
    return self;
}

- (CGFloat)cellHeight {
    return self.height / self.width * (kScreenWidth-10) + 10;
}

@end

@implementation HBK_HomeBottomModel


- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer
                           upCount:(NSInteger)upCount
                         downCount:(NSInteger)downCount
                       repostCount:(NSInteger)repostCount
                      commentCount:(NSInteger)commentCount {
    if (self = [super initWithCellHeight:cellHeight cellIdentifer:cellIdentifer]) {
        self.ding = upCount;
        self.cai = downCount;
        self.repost = repostCount;
        self.comment = commentCount;
    }
    return self;
}


@end





