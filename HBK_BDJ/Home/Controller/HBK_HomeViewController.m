//
//  HBK_HomeViewController.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/6/11.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_HomeViewController.h"
#import "HBK_TopLabelSelectView.h"
#import "HBK_HomeTableViewController.h"
@interface HBK_HomeViewController ()<HBK_TopLabelSelectViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) HBK_TopLabelSelectView *topView;
@property (nonatomic, strong) UIScrollView *bgScrollView;

@end

@implementation HBK_HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupUI];
    [self layoutUI];
    
    [self setChildViewController];
    
    [self addChildViewController];
    
    self.topView.titleArray = @[@"全体", @"图片", @"视频", @"段子"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI -
- (void)setupUI {
    [self.view addSubview:self.topView];
    [self.view addSubview:self.bgScrollView];
}
- (void)layoutUI {
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(kNavHeight);
        make.height.mas_equalTo(45);
    }];
    [self.bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view).offset(0);
        make.top.mas_equalTo(self.topView.mas_bottom).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
    }];
    self.bgScrollView.contentSize = CGSizeMake(kScreenWidth*4, CGRectGetHeight(self.bgScrollView.frame));
}

- (void)setChildViewController {
    HBK_HomeAllTableViewController *allVC = [[HBK_HomeAllTableViewController alloc] init];
    [self addChildViewController:allVC];
    
    HBK_HomeImageTableViewController *imageVC = [[HBK_HomeImageTableViewController alloc] init];
    [self addChildViewController:imageVC];
    
    HBK_HomeVedioTableViewController *vodieVC = [[HBK_HomeVedioTableViewController alloc] init];
    [self addChildViewController:vodieVC];
    
    HBK_HomeJokeTableViewController *jokeVC = [[HBK_HomeJokeTableViewController alloc] init];
    [self addChildViewController:jokeVC];
}

- (void)addChildViewController {
    NSInteger index = self.bgScrollView.contentOffset.x / kScreenWidth;
    UIViewController *childVC = self.childViewControllers[index];
    if ([childVC isViewLoaded]) return;
    childVC.view.frame = self.bgScrollView.bounds;
    [self.bgScrollView addSubview:childVC.view];
}


#pragma mark - HBK_TopLabelSelectViewDelegate -
- (void)didSelectHBK_TopLabelSelectViewItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", indexPath.row);

    //让scrollview滚到对应位置
    CGPoint offset =  self.bgScrollView.contentOffset;
    offset.x = indexPath.row * self.bgScrollView.frame.size.width;
    [self.bgScrollView setContentOffset:offset animated:YES];
    
    [self addChildViewController];
}

#pragma mark - UIScrollViewDelegate -
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self addChildViewController];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    CGPoint offset =  self.bgScrollView.contentOffset;
    offset.x = index * self.bgScrollView.frame.size.width;
    [self.bgScrollView setContentOffset:offset animated:YES];
    
    self.topView.selectIndex = index;
    //添加子控制器
    [self addChildViewController];
    
}
#pragma mark - Getter -
- (HBK_TopLabelSelectView *)topView {
    if (!_topView) {
        _topView = [[HBK_TopLabelSelectView alloc] init];
        _topView.delegate = self;
    }
    return _topView;
}
- (UIScrollView *)bgScrollView {
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] init];
        _bgScrollView.pagingEnabled = YES;
        _bgScrollView.showsHorizontalScrollIndicator = NO;
        _bgScrollView.delegate = self;
    }
    return _bgScrollView;
}

@end
