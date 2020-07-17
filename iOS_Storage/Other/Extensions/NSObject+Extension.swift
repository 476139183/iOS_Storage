//
//  NSObject+Extension.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

extension NSObject {
    
    /// 类名
    class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    /// 类名
    var className: String {
        let name = type(of: self).description()
        if (name.contains(".")) {
            return name.components(separatedBy: ".").last!;
        } else {
            return name;
        }
    }
    
}
