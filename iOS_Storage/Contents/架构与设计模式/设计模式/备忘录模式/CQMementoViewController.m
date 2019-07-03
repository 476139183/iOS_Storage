//
//  CQMementoViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQMementoViewController.h"
#import "GameRole.h"

@implementation CQMementoViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    GameRole *Jack = [GameRole new];
    [Jack displayState];
    
    [Jack fight];
    [Jack displayState];
}

@end
