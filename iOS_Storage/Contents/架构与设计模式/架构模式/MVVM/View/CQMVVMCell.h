//
//  CQMVVMCell.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQMVVMCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CQMVVMCell : UITableViewCell

@property (nonatomic, strong) CQMVVMCellModel *viewModel;
@property (nonatomic, strong) UILabel *numLabel;

@end

NS_ASSUME_NONNULL_END
