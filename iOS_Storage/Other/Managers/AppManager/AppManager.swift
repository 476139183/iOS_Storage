//
//  AppManager.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

struct AppManager {
    
    /// 获取版本号
    static func getVersion() -> String {
        Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
}
