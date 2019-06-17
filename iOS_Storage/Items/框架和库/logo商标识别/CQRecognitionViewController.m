//
//  CQRecognitionViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQRecognitionViewController.h"
#import "CQRecognitionManager.h"

@interface CQRecognitionViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation CQRecognitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(90, 200, 100, 40)];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"拍照识别" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(recognitionWithTakePhoto) forControlEvents:UIControlEventTouchDown];
}

/** 拍照识别 */
- (void)recognitionWithTakePhoto {
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    
    pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    pickerVC.delegate = self;
    
    [self presentViewController:pickerVC animated:YES completion:nil];
}

#pragma mark - UIImagePickController Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info {
    
    // 选择的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    [SVProgressHUD showWithStatus:@"识别中..."];
    [CQRecognitionManager recognitionLogoWithImage:image success:^(NSString * _Nonnull name) {
        [SVProgressHUD showSuccessWithStatus:name];
    } failure:^(NSString * _Nonnull errorMsg) {
        [SVProgressHUD showErrorWithStatus:errorMsg];
    }];
    
    // 手动关闭
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"取消了");
    // 手动关闭
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
