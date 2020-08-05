//
//  NSObject+PrefixExtension.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/5.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

extension NSObject: DingStockWrappable{}
extension DingStockWrapperProtocol where WrappedType: NSObject {
    
    /// 获取类的类名
    static var className: String {
        let name = NSStringFromClass(WrappedType.self)
        if (name.contains(".")) {
            return name.components(separatedBy: ".")[1];
        } else {
            return name;
        }
    }
    
    /// 获取实例的类名
    var className: String {
        let name = type(of: wrappedValue).description()
        if (name.contains(".")) {
            return name.components(separatedBy: ".")[1];
        } else {
            return name;
        }
    }
    
}
