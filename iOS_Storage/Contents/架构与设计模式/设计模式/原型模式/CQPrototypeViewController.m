//
//  CQPrototypeViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/23.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQPrototypeViewController.h"
#import "PrototypePerson.h"

@interface CQPrototypeViewController ()

@property (nonatomic, strong) PrototypePerson *person;

@end

@implementation CQPrototypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 原型模式，最常见的体现就是自定义copy
    self.person = [[PrototypePerson alloc] init];
    self.person.name = @"Jack";
}

- (IBAction)cloneButtonClicked:(id)sender {
    PrototypePerson *person = self.person.copy;
    person.name = @"Mary";
    NSLog(@"%@", person);
}

@end
