//
//  CQLeetCodeTwoSumViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQLeetCodeTwoSumViewController.h"

@interface CQLeetCodeTwoSumViewController ()

@end

@implementation CQLeetCodeTwoSumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@", [self twoSumOfArray:@[@(3), @(3), @(5)] target:6]);
}

- (NSArray *)twoSumOfArray:(NSArray *)array target:(NSInteger)target {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int i = 0; i < array.count; i++) {
        NSNumber *key = @(i);
        NSNumber *value = array[i];
        dict[key] = value;
    }
    
    NSMutableArray *resultArray = [NSMutableArray array];
    for (int i = 0; i < dict.allValues.count; i++) {
        NSNumber *key = @(i);
        
        NSNumber *targetValue = @(target - [dict[key] integerValue]);
        if ([dict.allValues containsObject:targetValue]) {
            
            NSArray *keyArray = [dict allKeysForObject:targetValue];
            
            [resultArray addObject:key];
            if ([keyArray.lastObject integerValue] == key.integerValue) {
                [resultArray addObject:keyArray.firstObject];
            } else {
                [resultArray addObject:keyArray.lastObject];
            }
            
            return resultArray;
        }
        
    }
    
    return resultArray;
}

@end
