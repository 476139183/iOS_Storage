//
//  GradientView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    private var colors: [UIColor] = [.white]
    private var direction: GradientDirection = .leftToRight
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(colors: [UIColor], direction: GradientDirection) {
        self.init()

        self.colors = colors
        self.direction = direction
    }
    
    func config(colors: [UIColor], direction: GradientDirection) {
        self.colors = colors
        self.direction = direction
        self.setNeedsLayout()
    }
    
    /// xib或storyboard通过此方法配置
    ///
    /// - Parameters:
    ///   - colors: 颜色数组
    ///   - direction: 渐变方向
    func configWith(colors: [UIColor], direction: GradientDirection) {
        self.colors = colors
        self.direction = direction
        //self.backgroundColor = UIColor.init(gradientBounds: self.bounds, colors: self.colors, direction: self.direction)
        self.backgroundColor = UIColor.gradientColorWith(bounds: self.bounds, colors: self.colors, direction: self.direction)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.gradientColorWith(bounds: self.bounds, colors: self.colors, direction: self.direction)
    }
    
}
