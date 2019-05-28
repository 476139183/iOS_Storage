//
//  Cat.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/21.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "Cat.h"
#import <objc/runtime.h>
#import "Cat2.h"

@implementation Cat

// miao方法没有实现

// 方案1（动态添加方法）
// Dynamically provides an implementation for a given selector for an instance method.
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    // 我们没有给Cat类声明miao方法，我们这里动态添加方法
//    if ([NSStringFromSelector(sel) isEqualToString:@"miao"]) {
//        class_addMethod(self, sel, (IMP)miao1, "v@:");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}

void miao1(id self, SEL _cmd) {
    NSLog(@"喵~");
}



///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////



// 方案2 
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"miao"]) {
        return [[Cat2 alloc] init];
    }
    return nil;
}



///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////



// 第三步：返回方法选择器，然后进入第四部；

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    // 判断你要转发的selector
    if ([NSStringFromSelector(aSelector) isEqualToString:@"miao"]) {
        // 为你的转发方法手动生成签名
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

// 第四部：这步我们修改调用对象
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL selector = [anInvocation selector];
    // 新建需要转发消息的对象
    Cat *cat = [[Cat alloc] init];
    if ([cat respondsToSelector:selector]) {
        // 唤醒这个方法
        [anInvocation invokeWithTarget:cat];
    } else {
        NSLog(@"没这个selector");
    }
}

@end
