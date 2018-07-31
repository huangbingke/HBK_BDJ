//
//  HBK_HomeImageCell.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_HomeImageCell.h"

@interface HBK_HomeImageCell ()

@property (nonatomic, strong) FLAnimatedImageView *contentImageView;
@property (nonatomic, strong) UIImageView *gifImageView;
@property (nonatomic, strong) UIButton *seeBigBtn;
@property (nonatomic, strong) UIImageView *placeHoldImageView;
@end

@implementation HBK_HomeImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//查看大图
- (void)clickSeeBigPicture {
    
}

- (void)loadModel:(HBK_HomeBaseModel *)model {
    if ([model isKindOfClass:[HBK_HomeImageModel class]]) {
        self.contentImageView.hidden = NO;
        HBK_HomeImageModel *imageModel = (HBK_HomeImageModel *)model;
        [self configureImageWithUrl:imageModel.image_small];
        if (imageModel.isBigPic) {
            self.seeBigBtn.hidden = NO;
            self.gifImageView.hidden = YES;
            self.contentImageView.clipsToBounds = YES;
            self.contentImageView.contentMode = UIViewContentModeTop;
        } else {
            self.seeBigBtn.hidden = YES;
            self.contentImageView.clipsToBounds = NO;
            self.contentImageView.contentMode = UIViewContentModeScaleToFill;
            if (imageModel.is_gif) {
                self.gifImageView.hidden = NO;
            } else {
                self.gifImageView.hidden = YES;
            }
        }
    } else {
        NSLog(@"------------");
        self.placeHoldImageView.hidden = NO;
        self.contentImageView.hidden = YES;
    }
}

- (void)configureImageWithUrl:(NSString *)url {
        [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:url]
                                 placeholderImage:nil
                                          options:SDWebImageLowPriority
                                         progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                 self.placeHoldImageView.hidden = NO;
                                             });

                                         } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                 self.placeHoldImageView.hidden = YES;
                                             });
                                         }];
}

- (void)setupUI {
    [self.contentView addSubview:self.contentImageView];
    [self.contentView addSubview:self.gifImageView];
    [self.contentView addSubview:self.seeBigBtn];
    [self.contentView addSubview:self.placeHoldImageView];
}

- (void)layoutUI {
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).offset(5);
        make.bottom.right.mas_equalTo(self.contentView).offset(-5);
    }];
    [self.gifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentImageView).offset(0);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    [self.seeBigBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(45);
    }];
    
    [self.placeHoldImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView).offset(0);
        make.top.mas_equalTo(self.contentView).offset(30);
        make.height.mas_equalTo(45);
    }];
}
//
#pragma mark - Getter -
- (FLAnimatedImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[FLAnimatedImageView alloc] init];
    }
    return _contentImageView;
}
- (UIImageView *)gifImageView {
    if (!_gifImageView) {
        _gifImageView = [[UIImageView alloc] init];
        _gifImageView.image = [UIImage imageNamed:@"common-gif"];
        _gifImageView.hidden = YES;
    }
    return _gifImageView;
}
- (UIButton *)seeBigBtn {
    if (!_seeBigBtn) {
        _seeBigBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_seeBigBtn setTitle:@"  点击查看大图" forState:(UIControlStateNormal)];
        [_seeBigBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_seeBigBtn setImage:[UIImage imageNamed:@"see-big-picture"] forState:(UIControlStateNormal)];
        [_seeBigBtn setBackgroundImage:[UIImage imageNamed:@"see-big-picture-background"] forState:(UIControlStateNormal)];
        [_seeBigBtn addTarget:self action:@selector(clickSeeBigPicture) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _seeBigBtn;
}

- (UIImageView *)placeHoldImageView {
    if (!_placeHoldImageView) {
        _placeHoldImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"imageBackground"]];
        _placeHoldImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _placeHoldImageView;
}


@end
