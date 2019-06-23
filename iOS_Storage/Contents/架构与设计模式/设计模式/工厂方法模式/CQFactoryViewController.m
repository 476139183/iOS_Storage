//
//  CQFactoryViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/22.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQFactoryViewController.h"
#import "ClothesFactory.h"
#import "NickFactory.h"
#import "AdidasFactory.h"

@interface CQFactoryViewController ()

@end

@implementation CQFactoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:button];
    button.frame = CGRectMake(90, 150, 150, 40);
    [button setTitle:@"工厂方法模式" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchDown];
}

- (void)test {
    // 衣服工厂
    // Nick工厂
    // Adidas工厂
    
    // Nick工厂和Adidas工厂都是衣服工厂
    // Nick工厂生产Nick，Adidas工厂生产Adidas
    
    // 简单工厂违背了设计模式中的开闭原则，工厂方法模式规避了这个问题
    // 但是工厂方法模式也有缺点，创建的类多，所以不要为了用设计模式而强行用设计模式
    
    // 如果要生产Adidas，将NickFactory改成AdidasFactory即可
    ClothesFactory *factory = [NickFactory new];
    Clothes *clothes = [factory createClothes];
    [clothes printInfo];
}

@end
