//
//  CQConstants.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

var isIphoneX: Bool {
    if #available(iOS 13.0,  *) {
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
    }else{
        if #available(iOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
    }
    return false
}

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




// MARK: - DingStock Used

let screenHeight = UIScreen.main.bounds.height
let screenWidth = UIScreen.main.bounds.width

let naviBarHeight: CGFloat = 44
/// statusBarHeight + statusBarHeight
let naviHeight = UIApplication.shared.statusBarFrame.height + naviBarHeight
let statusBarHeight = UIApplication.shared.statusBarFrame.height
var tabbarHeight: CGFloat {
    if naviHeight == 64 {
        return 49
    } else {
        return 83
    }
}
var safeBottomHeight: CGFloat {
    if naviHeight == 64 {
        return 0
    } else {
        return 34
    }
}
