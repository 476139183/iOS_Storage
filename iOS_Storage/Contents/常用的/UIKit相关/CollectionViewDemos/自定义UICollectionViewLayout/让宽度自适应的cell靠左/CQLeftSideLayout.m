//
//  CQLeftSideLayout.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/16.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQLeftSideLayout.h"

@implementation CQLeftSideLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    if (attributes.count == 1) {
        UICollectionViewLayoutAttributes *currentAttributes = attributes.firstObject;
        currentAttributes.frame = CGRectMake(self.sectionInset.left, currentAttributes.frame.origin.y, currentAttributes.frame.size.width, currentAttributes.frame.size.height);
    }
    
    return attributes;
    
}

@end
