//
//  HBK_ShowImageViewController.m
//  HBK_BDJ
//
//  Created by 黄冰珂 on 2018/8/1.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_ShowImageViewController.h"

@interface HBK_ShowImageViewController ()


@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) FLAnimatedImageView *picImageView;
@property (nonatomic, strong) UIButton *backBtn;
@end

@implementation HBK_ShowImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [self layoutUI];
    [self loadImageViewForModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadImageViewForModel {
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:self.imageModel.image_small] completed:nil];
}

- (void)backBtnAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupUI {
    [self.view addSubview:self.bgScrollView];
    [self.bgScrollView addSubview:self.picImageView];
    [self.view addSubview:self.backBtn];
}

- (void)layoutUI {
    [self.bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    CGFloat height = (self.imageModel.height / self.imageModel.width) * kScreenWidth;
    if (height < kScreenHeight) {
        self.bgScrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bgScrollView).offset(0);
            make.top.mas_equalTo(self.bgScrollView.mas_top).offset((kScreenHeight-height)/2);
            make.height.mas_equalTo(height);
            make.width.mas_equalTo(kScreenWidth);
        }];
    } else if (height > kScreenHeight) {
        self.bgScrollView.contentSize = CGSizeMake(kScreenWidth, height);
        [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bgScrollView).offset(0);
            make.top.mas_equalTo(self.bgScrollView.mas_top).offset(0);
            make.height.mas_equalTo(height);
            make.width.mas_equalTo(kScreenWidth);
        }];
    }
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(20);
        make.bottom.mas_equalTo(self.view).offset(-20);
        make.width.height.mas_equalTo(50);
    }];
}

#pragma mark - Getter -
- (UIScrollView *)bgScrollView {
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] init];
    }
    return _bgScrollView;
}
- (FLAnimatedImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[FLAnimatedImageView alloc] init];
    }
    return _picImageView;
}
- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"show_image_back_icon"] forState:(UIControlStateNormal)];
        [_backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _backBtn;
}
@end
