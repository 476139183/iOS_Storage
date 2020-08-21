//
//  GradientLabel.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class GradientLabel: UILabel {

    var colors: [UIColor] = [.white]
    var direction: GradientDirection = .leftToRight
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(colors: [UIColor], direction: GradientDirection) {
        super.init(frame: .zero)
        self.colors = colors
        self.direction = direction
    }
    
    /// xib或storyboard通过此方法配置
    ///
    /// - Parameters:
    ///   - colors: 颜色数组
    ///   - direction: 渐变方向
    func configWith(colors: [UIColor], direction: GradientDirection) {
        self.colors = colors
        self.direction = direction
        self.backgroundColor = UIColor.gradientColorWith(bounds: self.bounds, colors: self.colors, direction: self.direction)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.gradientColorWith(bounds: self.bounds, colors: self.colors, direction: self.direction)
    }

}


/// 从左到右的渐变label
class LeftToRightGradientLabel: GradientLabel {

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


/// 从上到下的渐变label
class TopToBottomGradientLabel: GradientLabel {

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
