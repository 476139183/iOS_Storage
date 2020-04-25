//
//  CQBaseViewController.h
//  iOS_Storage
//
//  Created by 蔡强 on 2018/6/28.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQBaseNaviBar.h"

@interface CQBaseViewController : UIViewController

/** 详情页链接 */
@property (nonatomic, copy) NSString *detailUrl;

// 自定义导航栏
@property (nonatomic, strong) CQBaseNaviBar *naviBar;

@end
