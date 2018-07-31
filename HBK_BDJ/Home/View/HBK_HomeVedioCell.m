//
//  HBK_HomeVedioCell.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_HomeVedioCell.h"

@interface HBK_HomeVedioCell ()

@property (nonatomic, strong) FLAnimatedImageView *bgImageView;
@property (nonatomic, strong) UILabel *playCountLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *playBtn;

@end
@implementation HBK_HomeVedioCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadModel:(HBK_HomeBaseModel *)model {
    if ([model isKindOfClass:[HBK_HomeVedioModel class]]) {
        HBK_HomeVedioModel *vedioModel = (HBK_HomeVedioModel *)model;
        [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:vedioModel.image_small]
                            placeholderImage:[UIImage imageNamed:@"imageBackground"]
                                     options:SDWebImageLowPriority];
        self.playCountLabel.text = vedioModel.playcount ? [NSString stringWithFormat:@"%ld播放", vedioModel.playcount] : @"";
//        vedioModel.cellHeight = vedioModel.height / vedioModel.width * (kScreenWidth-10) + 10;
        
        NSInteger minute = vedioModel.videotime / 60;
        NSInteger second = vedioModel.videotime % 60;
        self.timeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];
    }
}

#pragma mark - Action -
- (void)playBtnAction:(UIButton *)sender {
    NSLog(@"播放");
    
}

- (void)setupUI {
    NSArray<UIView *> *subViews = @[self.bgImageView,
                                    self.playCountLabel,
                                    self.playBtn,
                                    self.timeLabel];
    [subViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.contentView addSubview:obj];
    }];
}

- (void)layoutUI {
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).offset(5);
        make.bottom.right.mas_equalTo(self.contentView).offset(-5);
    }];
    [self.playCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(self.bgImageView).offset(0);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.mas_equalTo(self.bgImageView).offset(0);
    }];
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(60);
        make.centerX.mas_equalTo(self.bgImageView.mas_centerX);
        make.centerY.mas_equalTo(self.bgImageView.mas_centerY);
    }];
}

#pragma mark - Getter -
- (FLAnimatedImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[FLAnimatedImageView alloc] init];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _bgImageView;
}
- (UILabel *)playCountLabel {
    if (!_playCountLabel) {
        _playCountLabel = [UILabel labelWithFont:[UIFont systemFontOfSize:14]
                                       textColor:[UIColor whiteColor]
                                   textAlignment:(NSTextAlignmentRight)
                                            text:@""];
        _playCountLabel.backgroundColor = [UIColor blackColor];
        _playCountLabel.alpha = 0.5;
    }
    return _playCountLabel;
}
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel labelWithFont:[UIFont systemFontOfSize:14]
                                  textColor:[UIColor whiteColor]
                              textAlignment:(NSTextAlignmentRight)
                                       text:@""];
        _timeLabel.backgroundColor = [UIColor blackColor];
        _timeLabel.alpha = 0.5;
    }
    return _timeLabel;
}
- (UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"video-play"] forState:(UIControlStateNormal)];
        [_playBtn addTarget:self action:@selector(playBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _playBtn;
}


@end
