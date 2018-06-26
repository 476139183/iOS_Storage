//
//  IphoneMenuItemModel.m
//  iOS_Demo
//
//  Created by 蔡强 on 2018/6/26.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "IphoneMenuItemModel.h"

@implementation IphoneMenuItemModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"ID": @"id"
                                                                  }];
}

@end
