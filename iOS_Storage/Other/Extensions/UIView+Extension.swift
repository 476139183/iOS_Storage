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

extension UIView {
    
    /// 找到最近的那个遵循指定协议的responder
    func getLatestResponderConformsToProtocol(targetProtocol: Protocol) -> UIResponder? {
        
        var nextResponder = self.next
        
        print("next responder: \(nextResponder?.className())")
        
        while (nextResponder != nil) {
            if nextResponder!.conforms(to: targetProtocol) {
                return nextResponder
            } else {
                nextResponder = nextResponder?.next
            }
        }
        
        return nil
        
    }
    
}
