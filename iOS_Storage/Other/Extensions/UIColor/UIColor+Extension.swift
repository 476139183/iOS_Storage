//
//  UIColor+Extension.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

enum GradientDirection {
    case topToBottom          // 从上往下
    case leftToRight          // 从左往右
    case bottomToTop          // 从下往上
    case rightToLeft          // 从右往左
    case leftTopToRightBottom // 左上到右下
    case leftBottomToRightTop // 左下到右上
    case rightTopToLeftBottom // 右上到左下
    case RightBottomToLeftTop // 右下到左上
}

extension UIColor {
    
    static func random() -> UIColor {
        let red = CGFloat(arc4random() % 256) / 255.0
        let green = CGFloat(arc4random() % 256) / 255.0
        let blue = CGFloat(arc4random() % 256) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func color(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) -> UIColor {
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    
    func interpolateRGBColorTo(_ end: UIColor, fraction: CGFloat) -> UIColor {
        let f = min(max(0, fraction), 1)
        
        guard let c1 = self.cgColor.components, let c2 = end.cgColor.components else { return UIColor.white }
        
        let r: CGFloat = CGFloat(c1[0] + (c2[0] - c1[0]) * f)
        let g: CGFloat = CGFloat(c1[1] + (c2[1] - c1[1]) * f)
        let b: CGFloat = CGFloat(c1[2] + (c2[2] - c1[2]) * f)
        let a: CGFloat = CGFloat(c1[3] + (c2[3] - c1[3]) * f)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    func changeAlphaTo(_ alpha: CGFloat) -> UIColor {
        guard let c1 = self.cgColor.components else { return UIColor.white }
        
        let r: CGFloat = CGFloat(c1[0])
        let g: CGFloat = CGFloat(c1[1])
        let b: CGFloat = CGFloat(c1[2])
        
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    // RGBA->RGB
    //    func changeAlphaTo(_ alpha : CGFloat) -> UIColor{
    //
    //        guard let c1 = self.cgColor.components else { return UIColor.white }
    //
    //        var r: CGFloat = CGFloat(c1[0])
    //        var g: CGFloat = CGFloat(c1[1])
    //        var b: CGFloat = CGFloat(c1[2])
    //
    //        r = 1 * (1 - alpha ) + r * alpha
    //        g = 1 * (1 - alpha ) + g * alpha
    //        b = 1 * (1 - alpha ) + b * alpha
    //
    //        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    //    }
    
    static func colorWithHexString(_ hex: String) -> UIColor {
        var color = UIColor.red
        var cStr: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if cStr.hasPrefix("#") {
            let index = cStr.index(after: cStr.startIndex)
            cStr = cStr.substring(from: index)
        }
        if cStr.characters.count != 6 {
            return UIColor.black
        }
        
        let rRange = cStr.startIndex ..< cStr.index(cStr.startIndex, offsetBy: 2)
        let rStr = cStr.substring(with: rRange)
        
        let gRange = cStr.index(cStr.startIndex, offsetBy: 2) ..< cStr.index(cStr.startIndex, offsetBy: 4)
        let gStr = cStr.substring(with: gRange)
        
        let bIndex = cStr.index(cStr.endIndex, offsetBy: -2)
        let bStr = cStr.substring(from: bIndex)
        
        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0
        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string: gStr).scanHexInt32(&g)
        Scanner(string: bStr).scanHexInt32(&b)
        
        color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
        
        return color
    }
    
    
    /// 渐变色
    ///
    /// - Parameters:
    ///   - bounds: bounds
    ///   - colors: 颜色数组
    ///   - direction: 渐变方向
    /// - Returns: 渐变色
    static func gradientColorWith(bounds: CGRect, colors: [UIColor], direction: GradientDirection) -> UIColor {
        
        var cgColorArray: [CGColor] = []
        for color in colors {
            cgColorArray.append(color.cgColor)
        }
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 1)
        guard let context = UIGraphicsGetCurrentContext() else { return .white }
        context.saveGState();
        let colorSpace = colors.last?.cgColor.colorSpace
        guard let gradient = CGGradient.init(colorsSpace: colorSpace, colors: cgColorArray as CFArray, locations: nil) else {
            return .white
        }
        
        var startPoint = CGPoint.zero
        var endPoint = CGPoint.zero
        
        let width = bounds.size.width
        let height = bounds.size.height
        
        switch direction {
        case .topToBottom:
            startPoint = CGPoint.init(x: 0, y: 0)
            endPoint = CGPoint.init(x: 0, y: height)
        case .leftToRight:
            startPoint = CGPoint.init(x: 0, y: 0)
            endPoint = CGPoint.init(x: width, y: 0)
        case .bottomToTop:
            startPoint = CGPoint.init(x: 0, y: height)
            endPoint = CGPoint.init(x: 0, y: 0)
        case .rightToLeft:
            startPoint = CGPoint.init(x: width, y: 0)
            endPoint = CGPoint.init(x: 0, y: 0)
        case .leftTopToRightBottom:
            startPoint = CGPoint.init(x: 0, y: 0)
            endPoint = CGPoint.init(x: width, y: height)
        case .leftBottomToRightTop:
            startPoint = CGPoint.init(x: 0, y: height)
            endPoint = CGPoint.init(x: width, y: 0)
        case .rightTopToLeftBottom:
            startPoint = CGPoint.init(x: width, y: 0)
            endPoint = CGPoint.init(x: 0, y: height)
        case .RightBottomToLeftTop:
            startPoint = CGPoint.init(x: width, y: height)
            endPoint = CGPoint.init(x: 0, y: 0)
        }
        
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: .drawsBeforeStartLocation)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        context.restoreGState()
        UIGraphicsEndImageContext()
        
        return UIColor.init(patternImage: image)
    }
    
}



extension UIColor {
    
    static func darkBlueColor() -> UIColor {
        return UIColor(red: 18.0/255.0, green: 86.0/255.0, blue: 136.0/255.0, alpha: 1.0)
    }
    
    static func lightBlueColor() -> UIColor {
        return UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
    }
    
    static func duskColor() -> UIColor {
        return UIColor(red: 255/255.0, green: 181/255.0, blue: 68/255.0, alpha: 1.0)
    }
    
    static func customOrangeColor() -> UIColor {
        return UIColor(red: 40/255.0, green: 43/255.0, blue: 53/255.0, alpha: 1.0)
    }
    
}
