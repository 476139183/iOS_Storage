//
//  BaseCell3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BaseCell3<M: BaseModel3>: UITableViewCell {
    
    var model: M? {
        didSet {
            guard let model = self.model else {
                return
            }
            configModel(model)
        }
    }
    
    /// override in subclass
    func configModel(_ model: M) {
        
    }
    
    /// override in subclass
    func configUI() {
        
    }

    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
