//
//  ClothesFactory.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/23.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Clothes.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClothesFactory : NSObject

- (Clothes *)createClothes;

@end

NS_ASSUME_NONNULL_END
