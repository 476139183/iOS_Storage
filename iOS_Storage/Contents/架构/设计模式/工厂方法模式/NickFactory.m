//
//  NickFactory.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/23.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "NickFactory.h"
#import "Nick.h"

@implementation NickFactory

- (Clothes *)createClothes {
    NSLog(@"生产Nick");
    return [Nick new];
}

@end
