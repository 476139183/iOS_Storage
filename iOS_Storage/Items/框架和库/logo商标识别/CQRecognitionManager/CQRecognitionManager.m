//
//  CQRecognitionManager.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQRecognitionManager.h"
#import <AFNetworking.h>

// 用于logo商标识别获取 access_token 的 Api Key 和 Secret Key
static NSString * const kBaiduAIApiKey = @"";
static NSString * const kBaiduAISecretKey = @"";

@interface CQRecognitionManager ()

@property (class, nonatomic, copy) NSString *access_token;

@end

@implementation CQRecognitionManager

/**
 识别logo
 
 @param image 要识别的图片
 @param success 识别成功
 @param failure 识别失败
 */
+ (void)recognitionLogoWithImage:(UIImage *)image success:(void (^)(NSString *logoName))success failure:(void (^)(NSString *errorMsg))failure {
    
#warning token写死的，注意修改!!!!!!!!!!!!!!!!!!!!!!!!!!
    NSString *access_token = @"24.c02e7c52bb2a6ac648174f16a4e202df.2592000.1562825254.282335-16481700";
    
    // 识别logo
    void (^recognition)(void) = ^{
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
        
        //========== 图片转base64字符串 ==========//
        NSData *data = UIImagePNGRepresentation(newImage);
        NSString *base64Str = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
        
        // url
        NSString *url = @"https://aip.baidubce.com/rest/2.0/image-classify/v2/logo";
        // 参数
        NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
        paraDict[@"access_token"] = access_token;
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
                !failure ?: failure(responseObject[@"error_msg"]);
                // 如果token过期，将当前token置为nil
                if ([responseObject[@"error_code"] integerValue] == 111) {
                    CQRecognitionManager.access_token = nil;
                }
            } else {
                NSArray *result = responseObject[@"result"];
                NSDictionary *dict = result.firstObject;
                !success ?: success(dict[@"name"]);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            !failure ?: failure(error.localizedDescription);
        }];
    };
    
    
    // 没有access_token，调用接口获取
    if (!CQRecognitionManager.access_token) {
        // 获取token
        
    } else {
        recognition();
    }
}

/** 获取access_token */
+ (void)loadAccessTokenSuccess:(void (^)(NSString *token))success failure:(void (^)(NSString *errorMsg))failure {
    
}

@end
