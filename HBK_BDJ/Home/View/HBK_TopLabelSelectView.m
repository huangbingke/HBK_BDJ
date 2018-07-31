//
//  HBK_TopLabelSelectView.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/6/27.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_TopLabelSelectView.h"

@class HBK_TopLabelSelectViewCell;

static NSString * const cellID = @"HBK_TopLabelSelectViewCell";

@interface HBK_TopLabelSelectView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end
@implementation HBK_TopLabelSelectView


- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupUI];
        [self layoutUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.collectionView];
}

- (void)layoutUI {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

- (void)setTitleArray:(NSArray<NSString *> *)titleArray {
    _titleArray = titleArray;
    [self.collectionView reloadData];
    //默认选中第几行 一定要在数据加载完成之后再调用
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:(UICollectionViewScrollPositionNone)];
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectIndex = selectIndex;
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:selectIndex inSection:0] animated:YES scrollPosition:(UICollectionViewScrollPositionNone)];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titleArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HBK_TopLabelSelectViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.title = self.titleArray[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectHBK_TopLabelSelectViewItemAtIndexPath:)]) {
        [self.delegate didSelectHBK_TopLabelSelectViewItemAtIndexPath:indexPath];
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.frame.size.width/self.titleArray.count, self.frame.size.height);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - Getter -
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[HBK_TopLabelSelectViewCell class] forCellWithReuseIdentifier:cellID];
    }
    return _collectionView;
}
@end



#pragma mark - HBK_TopLabelSelectViewCell -
@interface HBK_TopLabelSelectViewCell ()

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *titleLabel;

@end
@implementation HBK_TopLabelSelectViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.titleLabel.textColor = [UIColor redColor];
        self.lineView.hidden = NO;
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
        self.lineView.hidden = YES;
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor redColor];
        _lineView.hidden = YES;
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel.mas_left).offset(0);
            make.right.mas_equalTo(self.titleLabel.mas_right).offset(0);
            make.height.mas_equalTo(3);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);
        }];
    }
    return _lineView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.contentView);
        }];
    }
    return _titleLabel;
}



@end














