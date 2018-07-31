//
//  HBK_HomeBottomCell.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_HomeBottomCell.h"

@interface HBK_HomeBottomCell ()

@property (nonatomic, strong) UIButton *upBtn;
@property (nonatomic, strong) UIButton *downBtn;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIButton *commentBtn;

@property (nonatomic, strong) UIImageView *line1;
@property (nonatomic, strong) UIImageView *line2;
@property (nonatomic, strong) UIImageView *line3;

//横线
@property (nonatomic, strong) UIImageView *HLine;

@end
@implementation HBK_HomeBottomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadModel:(HBK_HomeBaseModel *)model {
    if ([model isKindOfClass:[HBK_HomeBottomModel class]]) {
        HBK_HomeBottomModel *bottomModel = (HBK_HomeBottomModel *)model;
        [self.upBtn setTitle:[NSString stringWithFormat:@" %ld", bottomModel.ding] forState:(UIControlStateNormal)];
        [self.downBtn setTitle:[NSString stringWithFormat:@" %ld", bottomModel.cai] forState:(UIControlStateNormal)];
        [self.shareBtn setTitle:[NSString stringWithFormat:@" %ld", bottomModel.repost] forState:(UIControlStateNormal)];
        [self.commentBtn setTitle:[NSString stringWithFormat:@" %ld", bottomModel.comment] forState:(UIControlStateNormal)];

    }
}
#pragma mark - Action -
- (void)upBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    kMyLog(@"顶");
}
- (void)downBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;

    kMyLog(@"踩");
}
- (void)shareBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;

    kMyLog(@"分享");
}
- (void)commentBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;

    kMyLog(@"评论");
}

- (void)setupUI {
    NSArray <UIView *> *subViews = @[self.upBtn,
                                    self.downBtn,
                                    self.shareBtn,
                                    self.commentBtn,
                                    self.line1,
                                    self.line2,
                                    self.line3,
                                    self.HLine];
    [subViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.contentView addSubview:obj];
    }];
}
- (void)layoutUI {
    [self.HLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.mas_equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(1);
    }];
    [self.upBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.mas_equalTo(self.contentView).offset(0);
        make.width.mas_equalTo((kScreenWidth-3)/4);
    }];
    
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView).offset(0);
        make.left.mas_equalTo(self.upBtn.mas_right).offset(0);
        make.width.mas_equalTo(1);
    }];
    
    [self.downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView).offset(0);
        make.width.mas_equalTo((kScreenWidth-3)/4);
        make.left.mas_equalTo(self.line1.mas_right).offset(0);
    }];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView).offset(0);
        make.left.mas_equalTo(self.downBtn.mas_right).offset(0);
        make.width.mas_equalTo(1);
    }];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView).offset(0);
        make.width.mas_equalTo((kScreenWidth-3)/4);
        make.left.mas_equalTo(self.line2.mas_right).offset(0);
    }];
    [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView).offset(0);
        make.left.mas_equalTo(self.shareBtn.mas_right).offset(0);
        make.width.mas_equalTo(1);
    }];
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView).offset(0);
        make.width.mas_equalTo((kScreenWidth-3)/4);
        make.left.mas_equalTo(self.line3.mas_right).offset(0);
    }];
}


#pragma mark - Getter -
- (UIButton *)upBtn {
    if (!_upBtn) {
        _upBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_upBtn setImage:[UIImage imageNamed:@"mainCellDing"] forState:(UIControlStateNormal)];
        [_upBtn setTitleColor:UIColorFromRGBValue(0X888888) forState:(UIControlStateNormal)];
        
        [_upBtn setImage:[UIImage imageNamed:@"mainCellDingClick"] forState:(UIControlStateSelected)];
        [_upBtn setTitleColor:[UIColor redColor] forState:(UIControlStateSelected)];
        
        [_upBtn addTarget:self action:@selector(upBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        _upBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _upBtn;
}

- (UIButton *)downBtn {
    if (!_downBtn) {
        _downBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_downBtn setImage:[UIImage imageNamed:@"mainCellCai"] forState:(UIControlStateNormal)];
        [_downBtn setTitleColor:UIColorFromRGBValue(0X888888) forState:(UIControlStateNormal)];
        
        [_downBtn setImage:[UIImage imageNamed:@"mainCellCaiClick"] forState:(UIControlStateSelected)];
        [_downBtn setTitleColor:[UIColor redColor] forState:(UIControlStateSelected)];
        _downBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_downBtn addTarget:self action:@selector(downBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _downBtn;
}

- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_shareBtn setImage:[UIImage imageNamed:@"mainCellShare"] forState:(UIControlStateNormal)];
        [_shareBtn setTitleColor:UIColorFromRGBValue(0X888888) forState:(UIControlStateNormal)];
        
        [_shareBtn setImage:[UIImage imageNamed:@"mainCellShareClick"] forState:(UIControlStateSelected)];
        [_shareBtn setTitleColor:[UIColor redColor] forState:(UIControlStateSelected)];
        _shareBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_shareBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _shareBtn;
}
- (UIButton *)commentBtn {
    if (!_commentBtn) {
        _commentBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_commentBtn setImage:[UIImage imageNamed:@"mainCellComment"] forState:(UIControlStateNormal)];
        [_commentBtn setTitleColor:UIColorFromRGBValue(0X888888) forState:(UIControlStateNormal)];
        
        [_commentBtn setImage:[UIImage imageNamed:@"mainCellCommentClick"] forState:(UIControlStateSelected)];
        [_commentBtn setTitleColor:[UIColor redColor] forState:(UIControlStateSelected)];
        _commentBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_commentBtn addTarget:self action:@selector(commentBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _commentBtn;
}

- (UIImageView *)line1 {
    if (!_line1) {
        _line1 = [[UIImageView alloc] init];
        _line1.image = [UIImage imageNamed:@"cell-button-line"];
    }
    return _line1;
}
- (UIImageView *)line2 {
    if (!_line2) {
        _line2 = [[UIImageView alloc] init];
        _line2.image = [UIImage imageNamed:@"cell-button-line"];
    }
    return _line2;
}
- (UIImageView *)line3 {
    if (!_line3) {
        _line3 = [[UIImageView alloc] init];
        _line3.image = [UIImage imageNamed:@"cell-button-line"];
    }
    return _line3;
}
- (UIImageView *)HLine {
    if (!_HLine) {
        _HLine = [[UIImageView alloc] init];
        _HLine.image = [UIImage imageNamed:@"cell-content-line"];
    }
    return _HLine;
}
@end
