//
//  CQWaterfallLayout.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/29.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQWaterfallLayout.h"

@implementation CQWaterfallLayout

- (CGSize)collectionViewContentSize {
    return CGSizeMake(100, 1000);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return nil;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [[UICollectionViewLayoutAttributes alloc] init];
    layoutAttributes.frame = CGRectMake(90, indexPath.row * 100, 90, 90);
    return layoutAttributes;
}

@end
