//
//  HBK_HomeTableViewController.m
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_HomeTableViewController.h"
#import "HBK_HomeBaseModel.h"
#import "HBK_HomeUserInfoCell.h"
#import "HBK_HomeTextCell.h"
#import "HBK_HomeImageCell.h"
#import "HBK_HomeVedioCell.h"
#import "HBK_HomeBottomCell.h"
@interface HBK_HomeTableViewController ()<HBK_HomeProtocol, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) HBK_HomePresenter *homePresenter;

@end

@implementation HBK_HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(tableViewHeaderRefresh)];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(tableViewFooterLoadData)];
    [self.tableView registerClass:[HBK_HomeUserInfoCell class] forCellReuseIdentifier:kHomeUserInfoCellID];
    [self.tableView registerClass:[HBK_HomeTextCell class] forCellReuseIdentifier:kHomeTextCellID];
    [self.tableView registerClass:[HBK_HomeImageCell class] forCellReuseIdentifier:kHomeImageCellID];
    [self.tableView registerClass:[HBK_HomeVedioCell class] forCellReuseIdentifier:kHomeVedioCellID];
    [self.tableView registerClass:[HBK_HomeBottomCell class] forCellReuseIdentifier:kHomeBottomCellID];
    
    [self tableViewHeaderRefresh];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action -
//刷新
- (void)tableViewHeaderRefresh {
    [self.homePresenter refreshDataWithType:self.type];
}
//加载
- (void)tableViewFooterLoadData {
    [self.homePresenter loadMoreDataType:self.type];
}
#pragma mark - HBK_HomeProtocol -
- (void)showIndicator {
    [SVProgressHUD show];
}
- (void)showIndicatorWithInfo:(NSString *)infoString {
    [SVProgressHUD showWithStatus:infoString];
}
- (void)showErrorIndicatorWithInfo:(NSString *)infoString {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
    [SVProgressHUD showErrorWithStatus:infoString];
}
- (void)hideIndicator {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
    [SVProgressHUD dismiss];
}
- (void)reloadData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (HBK_HomeTableViewType)type {
    return 0;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.homePresenter.homeDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.homePresenter.homeDataArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HBK_HomeBaseModel *currentModel = self.homePresenter.homeDataArray[indexPath.section][indexPath.row];
    if ([currentModel isKindOfClass:[HBK_HomeUserInfoModel class]]) {
        HBK_HomeUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeUserInfoCellID forIndexPath:indexPath];
        [cell loadModel:currentModel];
        return cell;
    } else if ([currentModel isKindOfClass:[HBK_HomeTextModel class]]) {
        HBK_HomeTextCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeTextCellID forIndexPath:indexPath];
        [cell loadModel:currentModel];
        return cell;
    } else if ([currentModel isKindOfClass:[HBK_HomeImageModel class]]) {
        HBK_HomeImageCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeImageCellID forIndexPath:indexPath];
        if (!tableView.dragging && !tableView.decelerating) {
            [cell loadModel:currentModel];
        }
        return cell;
    } else if ([currentModel isKindOfClass:[HBK_HomeVedioModel class]]) {
        HBK_HomeVedioCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeVedioCellID forIndexPath:indexPath];
        if (!tableView.dragging && !tableView.decelerating) {
            [cell loadModel:currentModel];
        }
        return cell;
    } else if ([currentModel isKindOfClass:[HBK_HomeBottomModel class]]) {
        HBK_HomeBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeBottomCellID forIndexPath:indexPath];
        [cell loadModel:currentModel];
        return cell;
    } else  {
        return [[UITableViewCell alloc] init];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HBK_HomeBaseModel *currentModel = self.homePresenter.homeDataArray[indexPath.section][indexPath.row];
    return currentModel.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HBK_HomeBaseModel *currentModel = self.homePresenter.homeDataArray[indexPath.section][indexPath.row];
    return currentModel.cellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 15)];
    headerView.backgroundColor = UIColorFromRGBValue(0XF8F8F8);
    return headerView;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {//停止滑动的时候, scrollView没有动画效果
        [self loadVisiableImageCell];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self loadVisiableImageCell];
}

- (void)loadVisiableImageCell {
    NSArray *visiableCellArray = [self.tableView indexPathsForVisibleRows];
    for (NSIndexPath *indexPath in visiableCellArray) {
        HBK_HomeBaseModel *currentModel = self.homePresenter.homeDataArray[indexPath.section][indexPath.row];
        if ([currentModel isKindOfClass:[HBK_HomeImageModel class]]) {
            HBK_HomeImageCell *imageCell = [self.tableView cellForRowAtIndexPath:indexPath];
            [imageCell loadModel:currentModel];
        }
        if ([currentModel isKindOfClass:[HBK_HomeVedioModel class]]) {
            HBK_HomeVedioCell *vedioCell = [self.tableView cellForRowAtIndexPath:indexPath];
            [vedioCell loadModel:currentModel];
        }
    }
}


#pragma mark - Getter -
- (HBK_HomePresenter *)homePresenter {
    if (!_homePresenter) {
        _homePresenter = [[HBK_HomePresenter alloc] init];
        [_homePresenter attachView:self];
    }
    return _homePresenter;
}

@end


//================================================================================================================
#pragma mark - 全部 -
@implementation HBK_HomeAllTableViewController

- (HBK_HomeTableViewType)type {
    return HBK_HomeTableViewTypeAll;
}

@end
//================================================================================================================
#pragma mark - 图片 -
@implementation HBK_HomeImageTableViewController

- (HBK_HomeTableViewType)type {
    return HBK_HomeTableViewTypeImage;
}
@end
//================================================================================================================
#pragma mark - 视频 -
@implementation HBK_HomeVedioTableViewController

- (HBK_HomeTableViewType)type {
    return HBK_HomeTableViewTypeVodie;
}
@end
//================================================================================================================
#pragma mark - 段子 -
@implementation HBK_HomeJokeTableViewController

- (HBK_HomeTableViewType)type {
    return HBK_HomeTableViewTypeJoke;
}
@end












