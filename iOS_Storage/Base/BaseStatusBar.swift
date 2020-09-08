//
//  BaseStatusBar.swift
//  rebate
//
//  Created by caiqiang on 2020/8/10.
//  Copyright © 2020 dingstock. All rights reserved.
//

import UIKit
import SnapKit

class BaseStatusBar: UIView {

    /// 是否是默认高度(系统状态栏高度)
    @IBInspectable var isDefaultHeight: Bool = false
    
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isDefaultHeight {
            self.snp.remakeConstraints { (make) in
                make.left.right.top.equalToSuperview()
                make.height.equalTo(statusBarHeight).priority(.required)
            }
        }
        
    }

}
