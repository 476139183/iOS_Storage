//
//  LaunchGuideManager.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

@objcMembers class LaunchGuideManager: NSObject {
    
    /// 获取APP展示的第一个页面
    @objc class func getFirstPage() -> UIViewController {
        // 第一次打开APP
        // 或者 版本升级
        // 展示引导页
        
        let key = "version_used_launch"
        
        let currentVersion = AppManager.getVersion()
        
        // 存储的版本与当前版本一致
        if let storedVersion = UserDefaults.standard.string(forKey: key), storedVersion == currentVersion {
            return CQTabBarController()
        }
        
        UserDefaults.standard.set(currentVersion, forKey: key)
        UserDefaults.standard.synchronize()
        
        return LaunchGuideViewController()
        
    }
    
}
