//
//  CQCacheDemoViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/19.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQCacheDemoViewController.h"

@interface CQCacheDemoViewController () <NSCacheDelegate>

@property (nonatomic, strong) NSCache *cache1;

@end

@implementation CQCacheDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.cache1 = [[NSCache alloc] init];
    self.cache1.name = @"myCache";
    self.cache1.countLimit = 3;
    self.cache1.delegate = self;
    
    UIButton *saveButton = [[UIButton alloc] initWithFrame:CGRectMake(90, 90, 200, 40)];
    [self.view addSubview:saveButton];
    saveButton.backgroundColor = [UIColor redColor];
    [saveButton setTitle:@"save" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *takeoutButton = [[UIButton alloc] initWithFrame:CGRectMake(90, 150, 200, 40)];
    [self.view addSubview:takeoutButton];
    takeoutButton.backgroundColor = [UIColor blueColor];
    [takeoutButton setTitle:@"take out" forState:UIControlStateNormal];
    [takeoutButton addTarget:self action:@selector(takeoutButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // 继续添加
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(90, 210, 200, 40)];
    [self.view addSubview:addButton];
    addButton.backgroundColor = [UIColor purpleColor];
    [addButton setTitle:@"继续添加" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveButtonClicked {
    [self.cache1 setObject:@"Jack" forKey:@"name"];
}

- (void)takeoutButtonClicked {
    NSString *name = [self.cache1 objectForKey:@"name"];
    NSLog(@"name=====%@", name);
    NSLog(@"home======%@", NSHomeDirectory());
}

- (void)addButtonClicked {
    static NSInteger a = 1;
    [self.cache1 setObject:@(a) forKey:@(a)];
    a ++;
    // 当数量大于countLimit的时候会自动销毁之前的缓存
}


#pragma mark - NSCache Delegate

- (void)cache:(NSCache *)cache willEvictObject:(id)obj {
    NSLog(@"obj:%@ 即将被:%@销毁", obj, cache);
    // APP 进入后台之后 NSCache 会自动释放存储内容 ，并触发回调。
}

@end
