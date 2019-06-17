//
//  CQRecognitionManager.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQRecognitionManager.h"
#import <AFNetworking.h>
#import <YYKeychain.h>

// 图像识别，获取access_token需要的 Api Key 和 Secret Key
// access_token的有效期为30天
// 获取access_token方法：http://ai.baidu.com/docs#/Auth/top
static NSString * const kBaiduAIApiKey    = @"eER3jBAHkgfQdOjpDE78mZZz";
static NSString * const kBaiduAISecretKey = @"HK5ZyfZnPYO1NNuzURAQK71Z3T2bIPhM";

static NSString * const kService = @"baidu_logo_access_token";
static NSString * const kAccount = @"com.tima.aftermarket";

@implementation CQRecognitionManager

/**
 识别logo
 
 @param image 要识别的图片
 @param success 识别成功
 @param failure 识别失败
 */
+ (void)recognitionLogoWithImage:(UIImage *)image success:(void (^)(NSString *logoName))success failure:(void (^)(NSString *errorMsg))failure {
    // 获取token
    [self p_loadAccessTokenSuccess:^(NSString *token) {
        // 处理图片
        UIImage *newImage = [self p_handleImage:image];
        // 识别
        [self p_recognitionLogoWithImage:newImage success:^(NSString *logoName) {
            !success ?: success(logoName);
        } failure:^(NSString *errorMsg) {
            !failure ?: failure(errorMsg);
        }];
    } failure:^(NSString *errorMsg) {
        !failure ?: failure(errorMsg);
    }];
}

/** 处理图片 */
+ (UIImage *)p_handleImage:(UIImage *)image {
    //========== 压缩图片，宽为500 ==========//
    // 获取原图片的大小尺寸
    CGSize imageSize = image.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    // 根据目标图片的宽度计算目标图片的高度
    CGFloat targetHeight = (500 / width) * height;
    // 开启图片上下文
    UIGraphicsBeginImageContext(CGSizeMake(500, targetHeight));
    // 绘制图片
    [image drawInRect:CGRectMake(0,0, 500, targetHeight)];
    // 从上下文中获取绘制好的图片
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    return newImage;
}

/** 获取access_token */
+ (void)p_loadAccessTokenSuccess:(void (^)(NSString *token))success failure:(void (^)(NSString *errorMsg))failure {
    // 先看钥匙串里有没有
    NSString *token = [YYKeychain getPasswordForService:kService account:kAccount];
    if (token && ![token isEqualToString:@""]) {
        !success ?: success(token);
    } else {
        // 从百度获取
        NSString *url = @"https://aip.baidubce.com/oauth/2.0/token";
        NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
        paraDict[@"grant_type"] = @"client_credentials";
        paraDict[@"client_id"] = kBaiduAIApiKey;
        paraDict[@"client_secret"] = kBaiduAISecretKey;
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager POST:url parameters:paraDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSString *token = responseObject[@"access_token"];
            // 保存token
            [YYKeychain setPassword:token forService:kService account:kAccount];
            !success ?: success(token);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            !failure ?: failure(error.localizedDescription);
        }];
    }
}

/** 识别logo */
+ (void)p_recognitionLogoWithImage:(UIImage *)image success:(void (^)(NSString *logoName))success failure:(void (^)(NSString *errorMsg))failure {
    //========== 图片转base64字符串 ==========//
    NSData *data = UIImagePNGRepresentation(image);
    NSString *base64Str = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    
    // url
    NSString *url = @"https://aip.baidubce.com/rest/2.0/image-classify/v2/logo";
    // 参数
    NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
    paraDict[@"access_token"] = [YYKeychain getPasswordForService:kService account:kAccount];
    // 请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain",nil];
    [manager POST:url parameters:paraDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data = [base64Str dataUsingEncoding:NSUTF8StringEncoding];
        [formData appendPartWithFileData:data name:@"image" fileName:@"image" mimeType:@"txt"];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject[@"error_code"]) {
            // 如果token过期，将token置为空字符串，下次识别时会重新获取token
            if ([responseObject[@"error_code"] integerValue] == 111) {
                [YYKeychain setPassword:@"" forService:kService account:kAccount];
            }
            !failure ?: failure(responseObject[@"error_msg"]);
        } else {
            NSArray *result = responseObject[@"result"];
            NSDictionary *dict = result.firstObject;
            !success ?: success(dict[@"name"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failure ?: failure(error.localizedDescription);
    }];
}

@end
