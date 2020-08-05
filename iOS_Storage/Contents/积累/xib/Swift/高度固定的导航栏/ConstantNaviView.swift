//
//  ConstantNaviView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/5.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

@IBDesignable

class ConstantNaviView: UIView {
    
    /// 是否是默认高度
    @IBInspectable var isDefaultHeight: Bool = false

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isDefaultHeight {
            self.snp.remakeConstraints { (make) in
                make.left.right.top.equalToSuperview()
                make.height.equalTo(naviHeight)
            }
        }
        
    }

}
