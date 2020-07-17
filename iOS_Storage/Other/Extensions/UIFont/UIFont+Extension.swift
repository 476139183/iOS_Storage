//
//  UIFont+Extension.swift
//  mobile
//
//  Created by caiqiang on 2019/10/17.
//  Copyright © 2019 DingStock. All rights reserved.
//

import Foundation

extension UIFont {
    
    static let SFProText_Heavy = "SFProText-Heavy"
    static let SFProText_LightItalic = "SFProText-LightItalic"
    static let SFProText_HeavyItalic = "SFProText-HeavyItalic"
    static let SFProText_Medium = "SFProTextMedium"
    static let SFProText_Italic = "SFProText-Italic"
    static let SFProText_Bold = "SFProText-Bold"
    static let SFProText_SemiboldItalic = "SFProText-SemiboldItalic"
    static let SFProText_Light = "SFProText-Light"
    static let SFProText_MediumItalic = "SFProText-MediumItalic"
    static let SFProText_BoldItalic = "SFProText-BoldItalic"
    static let SFProText_Regular = "SFProText-Regular"
    static let SFProText_Semibold = "SFProText-Semibold"
    
    static let DINAlternate_Bold = "DINAlternate-Bold"
    
    
    class func DINAlternateFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: DINAlternate_Bold, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
}
