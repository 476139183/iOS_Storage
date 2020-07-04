//
//  UIScrollView+Capture.h
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/4.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (Capture)

///获取截屏图片
- (UIImage *)capture;

@end

NS_ASSUME_NONNULL_END
