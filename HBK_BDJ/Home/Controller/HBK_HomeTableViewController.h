//
//  HBK_HomeTableViewController.h
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/7/25.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBK_HomePresenter.h"
@interface HBK_HomeTableViewController : UITableViewController

- (HBK_HomeTableViewType)type;

@end


@interface HBK_HomeAllTableViewController : HBK_HomeTableViewController

@end

@interface HBK_HomeImageTableViewController : HBK_HomeTableViewController

@end

@interface HBK_HomeVedioTableViewController : HBK_HomeTableViewController

@end

@interface HBK_HomeJokeTableViewController : HBK_HomeTableViewController

@end












