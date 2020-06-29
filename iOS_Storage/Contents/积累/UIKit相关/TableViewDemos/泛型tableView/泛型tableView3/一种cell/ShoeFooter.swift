//
//  ShoeFooter.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/29.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ShoeFooter: BaseFooter3<String> {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    override func configUI() {
        contentView.backgroundColor = .orange
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    override func configModel(_ model: String) {
        label.text = model
    }

}
