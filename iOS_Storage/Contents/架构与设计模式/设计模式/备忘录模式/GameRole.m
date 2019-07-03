//
//  GameRole.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "GameRole.h"

@implementation GameRole

- (instancetype)init {
    if (self = [super init]) {
        self.hp = 100;
        self.mp = 100;
    }
    return self;
}

- (void)fight {
    self.hp = 0;
    self.mp = 0;
}

- (void)displayState {
    NSLog(@"hp=%f,mp=%f", self.hp, self.mp);
}

@end
