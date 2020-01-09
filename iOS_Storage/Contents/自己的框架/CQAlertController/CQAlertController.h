//
//  CQAlertController.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CQAlertActionStyle) {
    CQAlertActionStyleDefault = 0,
    CQAlertActionStyleCancel,
    CQAlertActionStyleDestructive
};

typedef NS_ENUM(NSInteger, CQAlertControllerStyle) {
    CQAlertControllerStyleActionSheet = 0,
    CQAlertControllerStyleAlert
};

@interface CQAlertAction : NSObject <NSCopying>

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(UIAlertActionStyle)style handler:(void (^ __nullable)(UIAlertAction *action))handler;

@property (nullable, nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) UIAlertActionStyle style;
@property (nonatomic, getter=isEnabled) BOOL enabled;

@end

@interface CQAlertController : UIViewController

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle;

- (void)addAction:(UIAlertAction *)action;

@property (nonatomic, readonly) NSArray<UIAlertAction *> *actions;

@property (nonatomic, strong, nullable) CQAlertAction *preferredAction;

- (void)addTextFieldWithConfigurationHandler:(void (^ __nullable)(UITextField *textField))configurationHandler;
@property (nullable, nonatomic, readonly) NSArray<UITextField *> *textFields;



@property (nonatomic, readonly) UIAlertControllerStyle preferredStyle;


@end

NS_ASSUME_NONNULL_END
