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
    
    /// 344格式的电话号码，如 135-2222-3333
    func phone344Formate() -> String {
        let str: String = self
        var arr: [String] = str.map { (c) -> String in
            return String.init(c)
        }
        
        arr.removeAll { (s) -> Bool in
            s == "-"
        }
        
        if arr.count > 7 {
            arr.insert("-", at: 7)
        }
        
        if arr.count > 3 {
            arr.insert("-", at: 3)
        }
        
        var result = arr.joined(separator: "")
        // 11位号码 + 2个"-"
        if result.count > 13 {
            result = result.subStringTo(index: 13)
        }
        return result
    }
    
    /// 普通格式的电话号码，如 13523422355
    func phoneNormalFormate() -> String {
        var arr = self.map { (c) -> String in
            return String.init(c)
        }
        arr.removeAll { (str) -> Bool in
            str == "-"
        }
        return arr.joined(separator: "")
    }
    
}


extension String {
    /// Range 转换为 NSRange
    func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
}

extension String {
    
    /// 获取一段文本的宽度
    func getWidthWith(font: UIFont, maxWidth: CGFloat) -> CGFloat {
        let attributes = [NSAttributedString.Key.font : font]
        let labelSize = NSString(string: self).boundingRect(with: CGSize(width: maxWidth, height: 1000), options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return labelSize.width
    }
    
}

