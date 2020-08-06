//
//  BaseXibEmbeddedView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/5.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BaseXibEmbeddedView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let name = self.className
        let view = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
}
