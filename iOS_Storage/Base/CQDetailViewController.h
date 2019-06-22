//
//  CQDetailViewController.h
//  iOS_Storage
//
//  Created by 蔡强 on 2018/6/28.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQDetailViewController : UIViewController

/**
 构造方法

 @param title 标题
 @param url 链接
 @return 详情页
 */
- (instancetype)initWithTitle:(NSString *)title url:(NSString *)url;

@end
