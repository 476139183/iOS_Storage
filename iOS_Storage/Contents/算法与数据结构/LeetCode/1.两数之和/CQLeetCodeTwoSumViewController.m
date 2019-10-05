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
    
    NSLog(@"%@", [self twoSumOfArray:@[@(3), @(3), @(5)] target:8]);
}

- (NSArray *)twoSumOfArray:(NSArray *)array target:(NSInteger)target {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int i = 0; i < array.count; i++) {
        NSNumber *key = array[i];
        NSNumber *value = @(i);
        dict[key] = value;
    }
    
    for (int i = 0; i < array.count; i++) {
        if (dict[@(target-[array[i] integerValue])]) {
            NSInteger targetIndex = [dict[@(target-[array[i] integerValue])] integerValue];
            if (targetIndex != i) {
                return @[@(i), @(targetIndex)];
            }
        }
    }
    
    return @[];
}

@end
