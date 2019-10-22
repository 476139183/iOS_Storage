//
//  CQPrivacyManager.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/14.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQPrivacyManager.h"
#import <AVFoundation/AVFoundation.h>

@implementation CQPrivacyManager

#pragma mark - 相机

/**
 检查相机的授权情况
 
 @param authorized         已授权
 @param deniedOrRestricted 用户拒绝或被限制
 @param notDetermined      用户尚未做决定
 */
+ (void)checkCameraAuthorizationStatusAuthorized:(nullable dispatch_block_t)authorized
                              deniedOrRestricted:(nullable dispatch_block_t)deniedOrRestricted
                                   notDetermined:(nullable dispatch_block_t)notDetermined {
    [self checkCameraAuthorizationStatusAuthorized:authorized denied:deniedOrRestricted restricted:deniedOrRestricted notDetermined:notDetermined];
}

/**
 检查相机的授权情况
 
 @param authorized    已授权
 @param denied        用户拒绝授权
 @param restricted    被限制
 @param notDetermined 用户尚未做决定
 */
+ (void)checkCameraAuthorizationStatusAuthorized:(nullable dispatch_block_t)authorized
                                          denied:(nullable dispatch_block_t)denied
                                      restricted:(nullable dispatch_block_t)restricted
                                   notDetermined:(nullable dispatch_block_t)notDetermined {
    AVAuthorizationStatus authorStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (authorStatus) {
        case AVAuthorizationStatusAuthorized:
        {
            !authorized ?: authorized();
        }
            break;
            
        case AVAuthorizationStatusDenied:
        {
            !denied ?: denied();
        }
            break;
            
        case AVAuthorizationStatusRestricted:
        {
            !restricted ?: restricted();
        }
            break;
            
        case AVAuthorizationStatusNotDetermined:
        {
            !notDetermined ?: notDetermined();
        }
            break;
    }
}

@end
