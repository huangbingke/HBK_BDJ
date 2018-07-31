//
//  HBK_HomeBaseModel.h
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HBK_HomeTableViewType) {
    HBK_HomeTableViewTypeAll = 1,
    HBK_HomeTableViewTypeImage = 10,
    HBK_HomeTableViewTypeJoke = 29,
    HBK_HomeTableViewTypeVodie = 41,
};


@interface HBK_HomeBaseModel : NSObject


// 用户 -- 发帖者
/** 用户的名字 */
@property (nonatomic, copy) NSString *name;
/** 用户的头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 帖子的文字内容 */
@property (nonatomic, copy) NSString *text;
/** 帖子审核通过的时间 */
@property (nonatomic, copy) NSString *created_at;
/** 顶数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发\分享数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论数量 */
@property (nonatomic, assign) NSInteger comment;
//最热评论
//@property (nonatomic, strong) XMGComment *top_cmt;
//帖子类型
@property (nonatomic, assign) HBK_HomeTableViewType type;
//图片宽度
@property (nonatomic, assign) CGFloat width;
//图片高度
@property (nonatomic, assign) CGFloat height;

/** 小图 */
@property (nonatomic, copy) NSString *image_small;

//是否是gif
@property (nonatomic, assign) BOOL is_gif;
/** 音频时长 */
@property (nonatomic, assign) NSInteger voicetime;
/** 视频时长 */
@property (nonatomic, assign) NSInteger videotime;
/** 音频\视频的播放次数 */
@property (nonatomic, assign) NSInteger playcount;

//视频url
@property (nonatomic, copy) NSString *videouri;



@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, copy) NSString *cellIdentifier;

- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer;


@end


@interface HBK_HomeUserInfoModel : HBK_HomeBaseModel

- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer
                              name:(NSString *)name
                           iconUrl:(NSString *)iconUrl
                        createTime:(NSString *)createTime;



@end



@interface HBK_HomeTextModel : HBK_HomeBaseModel


- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer
                              text:(NSString *)text;


@end


@interface HBK_HomeImageModel : HBK_HomeBaseModel

@property (nonatomic, assign) BOOL isBigPic;

- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer
                        imageWidth:(CGFloat)imageWidth
                       imageHeight:(CGFloat)imageHeight
                             isGif:(BOOL)isGif
                     smallImageUrl:(NSString *)smallImageUrl;


@end




@interface HBK_HomeVedioModel : HBK_HomeBaseModel


- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer
                         playCount:(NSInteger)playCount
                         videotime:(NSInteger)videoTime
                        bgImageUrl:(NSString *)bgImageUrl
                        videoWidth:(CGFloat)videoWidth
                       videoHeight:(CGFloat)videoHeight;

@end

@interface HBK_HomeBottomModel : HBK_HomeBaseModel


- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                     cellIdentifer:(NSString *)cellIdentifer
                           upCount:(NSInteger)upCount
                         downCount:(NSInteger)downCount
                       repostCount:(NSInteger)repostCount
                      commentCount:(NSInteger)commentCount;



@end
