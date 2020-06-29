//
//  ShoeHeader.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ShoeHeader: BaseHeader3<ShoeHeaderModel> {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .red
        return label
    }()

    override func configUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
    }
    
    override func configModel(_ model: ShoeHeaderModel) {
        titleLabel.text = model.title
    }

}
