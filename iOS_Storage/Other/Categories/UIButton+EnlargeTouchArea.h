//
//  UIButton+EnlargeTouchArea.h
//  Hippo
//
//  Created by caiqiang on 2018/3/9.
//  Copyright © 2018年 caiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (EnlargeTouchArea)

- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

- (void)setEnlargeEdge:(CGFloat)size;

@end
