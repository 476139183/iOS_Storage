//
//  XibCornerView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/20.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

@IBDesignable

class XibCornerView: UIView {

    @IBInspectable
    override var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius     }
    }

}
