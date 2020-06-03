//
//  StandardSwiftCollectionViewSectionHeaderView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StandardSwiftCollectionViewSectionHeaderView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let label = UILabel()
        addSubview(label)
        label.text = "这是组头"
        label.backgroundColor = .red
        label.textAlignment = .center
        label.textColor = .white
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
