//
//  CQMVVMViewModel.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQMVVMViewModel.h"
#import "CQMVVMModel.h"

@implementation CQMVVMViewModel

- (void)loadMoreData {
    if (self.updateblock) {
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 5; i ++) {
            CQMVVMModel *model = [CQMVVMModel new];
            model.num = i;
            [array addObject:model];
        }
        self.updateblock(array);
    }
}

@end
