//
//  UIView+Capture.swift
//  rebate
//
//  Created by caiqiang on 2020/9/1.
//  Copyright © 2020 dingstock. All rights reserved.
//

import Foundation

extension UIView {
    
    // 将当前视图转为UIImage
    func capture() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
}
