//
//  CQStandardOCCollectionViewCell.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStandardOCCollectionViewCell.h"

@implementation CQStandardOCCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat random = arc4random() / 255.0;
        self.contentView.backgroundColor = [UIColor colorWithRed:random green:random blue:random alpha:random];
    }
    return self;
}

@end
