//
//  NestedTableHeaderView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class NestedTableHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        let label = UILabel()
        addSubview(label)
        label.text = "这是表头"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
