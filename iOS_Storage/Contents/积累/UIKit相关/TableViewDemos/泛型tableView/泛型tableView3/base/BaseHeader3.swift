//
//  BaseHeader3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BaseHeader3<M: Any>: UITableViewHeaderFooterView {
    
    var model: M? {
        didSet {
            guard let model = self.model else {
                return
            }
            configModel(model)
        }
    }
    
    func configModel(_ model: M) {
        
    }
    
    func configUI() {
        
    }
    
    private func commonInit() {
        configUI()
    }

    required override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
}
