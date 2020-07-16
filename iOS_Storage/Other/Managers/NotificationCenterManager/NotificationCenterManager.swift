//
//  NotificationCenterManager.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

struct NotificationCenterManager {
    
    static func post(name: String, object: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: .init(name), object: object, userInfo: userInfo)
    }
    
    static func add(observer: Any, selector: Selector, name: String, object: Any? = nil) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: .init(name), object: object)
    }
    
}
