//
//  UIScrollView+Capture.m
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/4.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import "UIScrollView+Capture.h"

@implementation UIScrollView (Capture)

///获取截屏图片
- (UIImage *)capture
{
    UIImage* image = nil;
    //UIGraphicsBeginImageContext(self.contentSize);
    
    // 清晰截图
    UIGraphicsBeginImageContextWithOptions(self.contentSize, YES, 1);
    {
        CGPoint savedContentOffset = self.contentOffset;
        CGRect savedFrame = self.frame;
        self.contentOffset = CGPointZero;
        self.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
        
        [self.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        self.contentOffset = savedContentOffset;
        self.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}

@end
