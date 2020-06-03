//
//  PrototypePerson.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "PrototypePerson.h"

@interface PrototypePerson () <NSCopying>


@end

@implementation PrototypePerson

- (id)copyWithZone:(NSZone *)zone {
    PrototypePerson *person = [[PrototypePerson alloc] init];
    person.name = self.name;
    return person;
}

- (NSString *)description {
    return self.name;
}

@end
