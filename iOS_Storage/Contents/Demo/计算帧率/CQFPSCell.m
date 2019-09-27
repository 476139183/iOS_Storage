//
//  CQFPSCell.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQFPSCell.h"

@implementation CQFPSCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        for (int i = 0; i < 10; i ++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qbl"]];
            imageView.frame = CGRectMake(i * 50, 0, 50, 50);
            [self.contentView addSubview:imageView];
            imageView.layer.cornerRadius = 25;
            imageView.layer.masksToBounds = YES;
        }
    }
    return self;
}

// 重复创建子控件
- (void)createSubviews {
    for (int i = 0; i < 10; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qbl"]];
        imageView.frame = CGRectMake(i * 50, 0, 50, 50);
        [self.contentView addSubview:imageView];
        imageView.layer.cornerRadius = 25;
        imageView.layer.masksToBounds = YES;
    }
}

@end
