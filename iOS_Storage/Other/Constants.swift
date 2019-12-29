//
//  Constants.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

let screenHeight = UIScreen.main.bounds.height
let screenWidth = UIScreen.main.bounds.width

let naviBarHeight: CGFloat = 44
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
