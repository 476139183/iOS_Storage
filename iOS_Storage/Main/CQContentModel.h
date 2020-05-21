//
//  CQCatalogModel.h
//  iOS_Storage
//
//  Created by 蔡强 on 2018/6/28.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQBaseModel.h"

@interface CQContentModel : CQBaseModel

/** demo名称 */
@property (nonatomic, copy) NSString *demo_name;
/** controller的name */
@property (nonatomic, copy) NSString *controller_name;

@end
