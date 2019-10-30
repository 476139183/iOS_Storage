//
//  CQConstants.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

/// 屏幕宽
let kScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕高
let kScreenHeight = UIScreen.main.bounds.size.height

/// 状态栏高度
let kStatusBarHeight = UIApplication.shared.statusBarFrame.height
/// 导航栏高度
let kNavigationBarHeight = UIApplication.shared.statusBarFrame.height + 44

/// TabBar高度
var kTabBarHeight: CGFloat {
    if kStatusBarHeight == 44 {
        return 83
    } else {
        return 49
    }
}

/// HomeIndicator高度
var kHomeIndicatorHeight: CGFloat {
    if kStatusBarHeight == 44 {
        return 34
    } else {
        return 0
    }
}

