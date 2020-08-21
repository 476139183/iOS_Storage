//
//  GradientView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    /// 颜色数组
    var colors: [UIColor] = [.white]
    /// 渐变方向
    var direction: GradientDirection = .leftToRight
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// 纯代码快速构造方法
    /// - Parameters:
    ///   - colors: 颜色数组
    ///   - direction: 渐变方向
    init(colors: [UIColor], direction: GradientDirection) {
        super.init(frame: .zero)

        self.colors = colors
        self.direction = direction
    }
    
    /// xib或storyboard可以通过此方法配置
    ///
    /// - Parameters:
    ///   - colors: 颜色数组
    ///   - direction: 渐变方向
    func config(colors: [UIColor], direction: GradientDirection) {
        self.colors = colors
        self.direction = direction
        self.setNeedsLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.gradientColorWith(bounds: self.bounds, colors: self.colors, direction: self.direction)
    }
    
}


/// 从左到右的渐变view
class LeftToRightGradientView: GradientView {

    @IBInspectable var leftColor: UIColor = .white
    @IBInspectable var centerColor: UIColor?
    @IBInspectable var rightColor: UIColor = .white
    
    override func layoutSubviews() {
        self.direction = .leftToRight
        if let centerColor = self.centerColor {
            colors = [leftColor, centerColor, rightColor]
        } else {
            colors = [leftColor, rightColor]
        }
        super.layoutSubviews()
    }

}


/// 从上到下的渐变view
class TopToBottomGradientView: GradientView {

    @IBInspectable var topColor: UIColor = .white
    @IBInspectable var centerColor: UIColor?
    @IBInspectable var bottomColor: UIColor = .white
    
    override func layoutSubviews() {
        self.direction = .topToBottom
        if let centerColor = self.centerColor {
            colors = [topColor, centerColor, bottomColor]
        } else {
            colors = [topColor, bottomColor]
        }
        super.layoutSubviews()
    }

}
