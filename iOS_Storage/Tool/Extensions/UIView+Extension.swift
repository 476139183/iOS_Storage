//
//  UIView+Extension.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

extension UIView {
    
    func gradientBackground(startColor: UIColor, endColor: UIColor, frame: CGRect, startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint

        self.layer.addSublayer(gradientLayer)
    }
    
}
