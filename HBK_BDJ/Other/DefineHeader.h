//
//  DefineHeader.h
//  HBK_BSBDJ
//
//  Created by 黄冰珂 on 2018/6/11.
//  Copyright © 2018年 KK. All rights reserved.
//

#ifndef DefineHeader_h
#define DefineHeader_h





/**
 * 获取mainScreen的bounds的宽度
 */
#define kScreenWidth            [UIScreen mainScreen].bounds.size.width
/**
 * 获取mainScreen的bounds的高度
 */
#define kScreenHeight          [UIScreen mainScreen].bounds.size.height

/**
 * 获取mainScreen的bounds
 */
#define kScreenBounds [[UIScreen mainScreen] bounds]

/*
 *如果是iPhoneX 底部留空隙34, 如果不是空隙为0
 */
#define kIPhoneXBottomHeight    (kScreenHeight == 812.f ? 34.f : 0)
/*
 *tabBar高度  iPhoneX==83, 其他机型49
 */
#define kTabBarHeight           (kScreenHeight == 812.f ? 83.f : 49.f)

/**
 *导航栏-默认44(不考虑大标题情况)
 */
#define kNavigationBarHeight     44.f

/*
 *状态栏高度
 */
#define kStatusHeight           [UIApplication sharedApplication].statusBarFrame.size.height
/*
 *导航栏高度 + 状态栏
 */
#define kNavHeight              (kStatusHeight + kNavigationBarHeight)

/**
 block
 */
#define kBLOCK_SAFE_RUN(block, ...) block ? block(__VA_ARGS__) : nil;

//防止循环引用--- 弱引用 & 强引用
#define kWeakSelf(type)__weak typeof(type)weak##type = type;

#define kStrongSelf(type)__strong typeof(type)type = weak##type;


#if DEBUG
#define kMyLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define kMyLog(format, ...)
#endif

#define kRandomColor  [UIColor colorWithRed:arc4random() % 256 / 255. green:arc4random() % 256 / 255. blue:arc4random() % 256 / 255. alpha:1]

#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]





//========================= URL ==========================
#define kHomeURL    @"http://api.budejie.com/api/api_open.php"
















#endif /* DefineHeader_h */
