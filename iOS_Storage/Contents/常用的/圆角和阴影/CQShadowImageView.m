//
//  CQShadowImageView.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQShadowImageView.h"

@implementation CQShadowImageView

- (void)customerShadowWithShadowColor:(UIColor *)shadowColor
                        shadowOpacity:(CGFloat)shadowOpacity
                         shadowRadius:(CGFloat)shadowRadius
                      shadowPathWidth:(CGFloat)shadowPathWidth
                           viewRadius:(CGFloat)viewRadius
                           viewHeight:(CGFloat)height
                            viewWidth:(CGFloat)width
                           shadowSide:(CQShadowPathSide)shadowPathSide {
    
    self.layer.cornerRadius = viewRadius;
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius =  shadowRadius;
    self.layer.shadowOffset = CGSizeZero;
    
    CGRect shadowRect;
    CGFloat originX = 0;
    CGFloat originY = 0;
    CGFloat originW = width;
    CGFloat originH = height;
    
    switch (shadowPathSide) {
        case CQShadowPathSideTop:
            shadowRect  = CGRectMake(originX, originY - shadowPathWidth / 2, originW,  shadowPathWidth);
            break;
        case CQShadowPathSideBottom:
            shadowRect  = CGRectMake(originX, originH -shadowPathWidth / 2, originW, shadowPathWidth);
            break;
            
        case CQShadowPathSideLeft:
            shadowRect  = CGRectMake(originX - shadowPathWidth / 2, originY, shadowPathWidth, originH);
            break;
            
        case CQShadowPathSideRight:
            shadowRect  = CGRectMake(originW - shadowPathWidth / 2, originY, shadowPathWidth, originH);
            break;
        case CQShadowPathSideNoTop:
            shadowRect  = CGRectMake(originX -shadowPathWidth / 2, originY + 1, originW +shadowPathWidth,originH + shadowPathWidth / 2);
            break;
        case CQShadowPathSideAllSide:
            shadowRect  = CGRectMake(originX - shadowPathWidth / 2, originY - shadowPathWidth / 2, originW +  shadowPathWidth, originH + shadowPathWidth);
            break;
            
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = path.CGPath;
}

@end
