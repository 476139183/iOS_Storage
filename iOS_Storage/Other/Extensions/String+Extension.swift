//
//  String+Extension.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/5.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

extension String {
    
    /// 去除两端空格
    func removeBothEndsWhitespace() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    /// 去除两端空格和换行
    func removeBothEndsWhitespaceAndNewlines() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// 截取规定下标之后的字符串
    func subStringFrom(index: Int)-> String {
        let temporaryString: String = self
        let temporaryIndex = temporaryString.index(temporaryString.startIndex, offsetBy: 3)
        return String(temporaryString[temporaryIndex...])
    }
    
    /// 截取规定下标之前的字符串
    func subStringTo(index: Int) -> String {
        let temporaryString = self
        let temporaryIndex = temporaryString.index(temporaryString.startIndex, offsetBy: index - 1)
        return String(temporaryString[...temporaryIndex])
    }
    
}


extension String {
    /// Range 转换为 NSRange
    func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
}
