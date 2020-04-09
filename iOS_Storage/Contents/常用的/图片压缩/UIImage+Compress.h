//
//  UIImage+Compress.h
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/8.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Compress)

- (NSData *)compressWithMaxLength:(NSUInteger)maxLength;

@end

NS_ASSUME_NONNULL_END
