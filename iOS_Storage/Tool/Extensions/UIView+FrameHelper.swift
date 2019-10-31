//
//  UIView+FrameHelper.swift
//  FrameHelper
//
//  Created by caiqiang on 2019/10/31.
//  Copyright © 2019 Caiqiang. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 起点 x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame = CGRect(x: newValue, y: y, width: width, height: height)
        }
    }
    
    /// 起点 y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame = CGRect(x: x, y: newValue, width: width, height: height)
        }
    }
    
    /// 宽
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame = CGRect(x: x, y: y, width: newValue, height: height)
        }
    }
    
    /// 高
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame = CGRect(x: x, y: y, width: width, height: newValue)
        }
    }
    
    /// 最大 x
    var maxX: CGFloat {
        get {
            return x + width
        }
        set {
            x = newValue - width
        }
    }
    
    /// 最大 y
    var maxY: CGFloat {
        get {
            return y + height
        }
        set {
            y = newValue - height
        }
    }
    
    /// 中心 x
    var midX: CGFloat {
        get {
            return x + width / 2
        }
        set {
            x = newValue - width / 2
        }
    }
    
    /// 中心 y
    var midY: CGFloat {
        get {
            return y + height / 2
        }
        set {
            y = newValue - height / 2
        }
    }
    
}
