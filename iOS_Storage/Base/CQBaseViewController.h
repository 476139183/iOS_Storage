//
//  CQBaseViewController.h
//  iOS_Storage
//
//  Created by 蔡强 on 2018/6/28.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQBaseNaviBar.h"

#define SWIFT_SUBCLASS __attribute__((objc_subclassing_restricted))

@interface CQBaseViewController : UIViewController

/** 详情页链接 */
@property (nonatomic, copy) NSString *detailUrl;

// 自定义导航栏
@property (nonatomic, strong) CQBaseNaviBar *naviBar;

@end
