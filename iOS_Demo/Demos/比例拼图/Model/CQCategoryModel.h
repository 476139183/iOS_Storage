//
//  CQCategoryModel.h
//  iOS_Demo
//
//  Created by 蔡强 on 2018/6/23.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQCategoryItemModel.h"

@protocol CQCategoryItemModel;

@interface CQCategoryModel : JSONModel

@property (nonatomic, strong) NSArray <CQCategoryItemModel> *category_sale;

@end
