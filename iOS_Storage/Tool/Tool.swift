//
//  Tool.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/12.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

class Tool {
    
    /// 计算label宽度
    class func getLabelWidthWith(text: String, font: UIFont, maxWidth: CGFloat) -> CGFloat {
        let attributes = [NSAttributedString.Key.font : font]
        let labelSize = NSString(string: text).boundingRect(with: CGSize(width: maxWidth, height: 1000), options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return labelSize.width
    }
    
}
