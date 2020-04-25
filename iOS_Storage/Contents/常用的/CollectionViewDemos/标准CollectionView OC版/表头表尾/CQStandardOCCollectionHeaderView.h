//
//  CQStandardOCCollectionHeaderView.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQStandardOCCollectionHeaderView : UIView

/** 布局刷新回调 */
@property (nonatomic, copy) dispatch_block_t layoutBlock;

@end

NS_ASSUME_NONNULL_END
