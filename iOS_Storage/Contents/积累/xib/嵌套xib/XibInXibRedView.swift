//
//  XibInXibRedView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/21.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class XibInXibRedView: UIView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = Bundle.main.loadNibNamed("XibInXibRedView", owner: nil, options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
