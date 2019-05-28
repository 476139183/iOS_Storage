//
//  CQKVCController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQKVCController.h"

@interface CQKVCController ()

@property (nonatomic, copy) NSString *name;

@end

@implementation CQKVCController

//- (void)setName:(NSString *)name {
//    NSLog(@"setName调用");
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setValue:@"hehe" forKey:@"name"];
    NSLog(@"self.name=====%@", self.name);
}

@end
