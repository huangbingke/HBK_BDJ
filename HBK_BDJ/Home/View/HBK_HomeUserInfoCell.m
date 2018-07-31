//
//  HBK_HomeUserInfoCell.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_HomeUserInfoCell.h"

@interface HBK_HomeUserInfoCell ()

@property (nonatomic, strong) FLAnimatedImageView *iconImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *moreBtn;

@end

@implementation HBK_HomeUserInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)loadModel:(HBK_HomeBaseModel *)model {
    if ([model isKindOfClass:[HBK_HomeUserInfoModel class]]) {
        HBK_HomeUserInfoModel *userModel = (HBK_HomeUserInfoModel *)model;
        self.userNameLabel.text = userModel.name ? userModel.name : @"";
        self.timeLabel.text = userModel.created_at ? userModel.created_at : @"";
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:userModel.profile_image]
                              placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]
                                       options:(SDWebImageLowPriority)];
    }
}

#pragma mark - Action -
- (void)moreBtnAction:(UIButton *)sender {
    NSLog(@"更多");
}


- (void)setupUI {
    NSArray<UIView *> *subViews = @[self.iconImageView,
                                    self.userNameLabel,
                                    self.timeLabel,
                                    self.moreBtn];
    [subViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.contentView addSubview:obj];
    }];
}
- (void)layoutUI {
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.height.mas_equalTo(35);
    }];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView).offset(0);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(5);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.iconImageView).offset(0);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(5);
    }];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.height.mas_equalTo(30);
    }];
}

#pragma mark - Getter -
- (FLAnimatedImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[FLAnimatedImageView alloc] init];
    }
    return _iconImageView;
}

- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [UILabel labelWithFont:[UIFont systemFontOfSize:15]
                                      textColor:UIColorFromRGBValue(0X888888)
                                  textAlignment:(NSTextAlignmentLeft)
                                           text:@""];
    }
    return _userNameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel labelWithFont:[UIFont systemFontOfSize:13]
                                  textColor:UIColorFromRGBValue(0X888888)
                              textAlignment:(NSTextAlignmentLeft)
                                       text:@""];
    }
    return _timeLabel;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_moreBtn setBackgroundImage:[UIImage imageNamed:@"cellmorebtnnormal"] forState:(UIControlStateNormal)];
        [_moreBtn addTarget:self action:@selector(moreBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _moreBtn;
}


@end
