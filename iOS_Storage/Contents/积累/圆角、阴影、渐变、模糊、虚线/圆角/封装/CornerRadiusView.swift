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
    private var corners: UIRectCorner?
    
    init(radius: CGFloat, corners: UIRectCorner?) {
        super.init(frame: .zero)
        self.radius = radius
        self.corners = corners
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        resetCornerRadius()
    }
    
    private func resetCornerRadius() {
        let maskPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: corners ?? [], cornerRadii: .init(width: radius, height: radius))
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }

}
