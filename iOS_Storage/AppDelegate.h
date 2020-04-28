//
//  AppDelegate.h
//  iOS_Storage
//
//  Created by 蔡强 on 2018/6/22.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kAPPDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign) BOOL allowOrentitaionRotation;

@end

