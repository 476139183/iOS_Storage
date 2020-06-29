//
//  AnimalHeader.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/19.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class AnimalHeader: BaseHeader3<String> {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func configUI() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    override func configModel(_ model: String) {
        titleLabel.text = model
    }

}
