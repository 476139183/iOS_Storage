//
//  String+Extension.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/5.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

extension String {
    
    /// 移除两端空格
    func removeBothEndsWhiteSpace() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
}
