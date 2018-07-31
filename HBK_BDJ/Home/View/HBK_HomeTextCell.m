//
//  HBK_HomeTextCell.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_HomeTextCell.h"

@interface HBK_HomeTextCell ()

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation HBK_HomeTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadModel:(HBK_HomeBaseModel *)model {
    if ([model isKindOfClass:[HBK_HomeTextModel class]]) {
        HBK_HomeTextModel *textModle = (HBK_HomeTextModel *)model;
        self.contentLabel.text = textModle.text ? textModle.text : @"";
    }
}

- (void)setupUI {
    [self.contentView addSubview:self.contentLabel];
}
- (void)layoutUI {
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).offset(5);
        make.bottom.right.mas_equalTo(self.contentView).offset(-5);
    }];
}
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel labelWithFont:[UIFont systemFontOfSize:15]
                                     textColor:[UIColor blackColor]
                                 textAlignment:(NSTextAlignmentLeft)
                                          text:@""];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}





@end
