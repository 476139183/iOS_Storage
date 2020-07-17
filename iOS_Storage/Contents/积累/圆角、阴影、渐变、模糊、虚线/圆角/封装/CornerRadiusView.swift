//
//  CornerRadiusView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

/// 圆角view
class CornerRadiusView: UIView {
    
    private var radius: CGFloat = 0
    private var corners: UIRectCorner = []
    
    private var maskLayer = CAShapeLayer()
    
    
    /// 圆角view
    /// - Parameters:
    ///   - radius: 圆角大小
    ///   - corners: 支持圆角的地方
    func setCornerRadius(radius: CGFloat, corners: UIRectCorner) {
        self.radius = radius
        self.corners = corners
        self.layoutIfNeeded()
    }
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.layer.mask = maskLayer
    }
    
    
    // MARK: -
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        resetCornerRadius()
    }
    
    /// 重置圆角
    private func resetCornerRadius() {
        let maskPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
    }

}
