//
//  CQMVVMViewModel.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQMVVMViewModel : NSObject

@property (nonatomic, copy) void(^updateblock)(NSMutableArray *dataArray);

- (void)loadMoreData;

@end

NS_ASSUME_NONNULL_END
