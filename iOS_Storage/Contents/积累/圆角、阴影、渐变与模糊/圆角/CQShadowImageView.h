//
//  CQShadowImageView.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQShadowImageView : UIImageView

- (void)customerShadowWithShadowColor:(UIColor *)shadowColor
  shadowOpacity:(CGFloat)shadowOpacity
   shadowRadius:(CGFloat)shadowRadius
shadowPathWidth:(CGFloat)shadowPathWidth
     viewRadius:(CGFloat)viewRadius
     viewHeight:(CGFloat)height
      viewWidth:(CGFloat)width
                           shadowSide:(CQShadowPathSide)shadowPathSide;

@end

NS_ASSUME_NONNULL_END
