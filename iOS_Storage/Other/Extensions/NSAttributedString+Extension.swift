//
//  NSAttributedString+Extension.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    static func attributedString(string: String?, fontSize size: CGFloat, color: UIColor?) -> NSAttributedString? {
        guard let string = string else { return nil }
        
        let attributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): color ?? UIColor.black,
                          convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.boldSystemFont(ofSize: size)]
        
        let attributedString = NSMutableAttributedString(string: string, attributes: convertToOptionalNSAttributedStringKeyDictionary(attributes))
        
        return attributedString
    }
    
    static func attributedString(string: String?, font: UIFont, color: UIColor?) -> NSAttributedString? {
        guard let string = string else { return nil }
        
        let attributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): color ?? UIColor.black,
                          convertFromNSAttributedStringKey(NSAttributedString.Key.font): font]
        
        let attributedString = NSMutableAttributedString(string: string, attributes: convertToOptionalNSAttributedStringKeyDictionary(attributes))
        
        return attributedString
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
