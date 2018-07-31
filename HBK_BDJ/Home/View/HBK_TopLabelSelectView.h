//
//  HBK_TopLabelSelectView.h
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/6/27.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HBK_TopLabelSelectViewDelegate <NSObject>

- (void)didSelectHBK_TopLabelSelectViewItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface HBK_TopLabelSelectView : UIView

@property (nonatomic, strong) NSArray <NSString *> *titleArray;
@property (nonatomic, weak) id <HBK_TopLabelSelectViewDelegate> delegate;

@property (nonatomic, assign) NSInteger selectIndex;





@end



@interface HBK_TopLabelSelectViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *title;

@end















