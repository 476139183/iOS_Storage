//
//  BaseXibView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/21.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

@IBDesignable

class BaseXibView: UIView {
    
    /// 圆角大小
    @IBInspectable
    var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }
    
    /// 边框宽度
    @IBInspectable
    var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    /// 边框颜色
    @IBInspectable
    var borderColor: UIColor {
        set { layer.borderColor = newValue.cgColor }
        get { return UIColor.init(cgColor: layer.borderColor ?? UIColor.clear.cgColor) }
    }
    
    /// 阴影颜色
    @IBInspectable
    var shadowColor: UIColor {
        set { layer.shadowColor = newValue.cgColor }
        get { return UIColor.init(cgColor: layer.shadowColor ?? UIColor.clear.cgColor) }
    }
    
    /// 阴影偏移量
    @IBInspectable
    var shadowOffset: CGSize {
        set { layer.shadowOffset = newValue }
        get { return layer.shadowOffset }
    }
    
    /// 阴影不透明度
    @IBInspectable
    var shadowOpacity: Float {
        set { layer.shadowOpacity = newValue }
        get { return layer.shadowOpacity }
    }
    
    /// 阴影圆角
    @IBInspectable
    var shadowRadius: CGFloat {
        set { layer.shadowRadius = newValue }
        get { return layer.shadowRadius }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
