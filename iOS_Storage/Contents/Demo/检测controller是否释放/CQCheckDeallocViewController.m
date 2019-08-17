//
//  CQCheckDeallocViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/16.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQCheckDeallocViewController.h"

@interface CQCheckDeallocViewController ()

@property (nonatomic, copy) dispatch_block_t block;

@end

@implementation CQCheckDeallocViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSLog(@"call initWithNibName");
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awake from nib");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //UIImage *img = [UIImage imageWithContentsOfFile:<#(nonnull NSString *)#>]
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(90, 90, 90, 90)];
    [self.view addSubview:imageView];
//    imageView.image = [UIImage imageWithContentsOfFile:<#(nonnull NSString *)#>]
    
    self.block = ^{
        self.view.backgroundColor = [UIColor redColor];
    };
}

- (void)dealloc {
    NSLog(@"vc已释放");
}

@end
