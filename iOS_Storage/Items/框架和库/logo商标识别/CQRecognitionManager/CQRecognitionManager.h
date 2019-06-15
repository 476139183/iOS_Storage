//
//  CQRecognitionManager.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQRecognitionManager : NSObject

/**
 logo商标识别
 
 @param image 识别的图片
 */
+ (void)recognitionLogoWithImage:(UIImage *)image success:(void (^)(NSString *name))success failure:(void (^)(NSString *errorMsg))failure;

@end

NS_ASSUME_NONNULL_END
