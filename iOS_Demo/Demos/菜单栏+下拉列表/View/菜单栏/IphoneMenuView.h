//
//  IphoneMenuView.h
//  iOS_Demo
//
//  Created by 蔡强 on 2018/6/26.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IphoneMenuModel.h"

@class IphoneMenuView;

@protocol IphoneMenuViewDelegate <NSObject>

- (void)menuView:(IphoneMenuView *)menuView clickedButtonAtIndex:(NSInteger)index;

@end

@interface IphoneMenuView : UIView

@property (nonatomic, strong) IphoneMenuModel *model;
@property (nonatomic, weak) id <IphoneMenuViewDelegate> delegate;

@end
