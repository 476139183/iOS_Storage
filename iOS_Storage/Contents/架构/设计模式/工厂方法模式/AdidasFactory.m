//
//  AdidasFactory.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/23.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "AdidasFactory.h"
#import "Adidas.h"

@implementation AdidasFactory

- (Clothes *)createClothes {
    NSLog(@"生产Adidas");
    return [Adidas new];
}

@end
