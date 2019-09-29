//
//  GradientLabel.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class GradientLabel: UILabel {

    private var colors: [UIColor] = [.white]
    private var direction: GradientDirection = .leftToRight
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(colors: [UIColor], direction: GradientDirection) {
        self.init()
        
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
        self.backgroundColor = UIColor.gradientColorWith(bounds: self.bounds, colors: self.colors, direction: self.direction)
    }

}
