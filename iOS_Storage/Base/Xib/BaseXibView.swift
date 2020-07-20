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
    
    @IBInspectable
    override var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        set { layer.borderColor = newValue.cgColor }
        get { return UIColor.init(cgColor: layer.borderColor ?? UIColor.clear.cgColor) }
    }
    
}
