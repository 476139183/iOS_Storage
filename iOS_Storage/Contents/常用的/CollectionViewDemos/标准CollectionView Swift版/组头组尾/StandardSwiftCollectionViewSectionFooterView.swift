//
//  StandardSwiftCollectionViewSectionFooterView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StandardSwiftCollectionViewSectionFooterView: UICollectionReusableView {
    
    let label = UILabel()
    
    var title: String? {
        didSet {
            label.text = self.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(label)
        label.backgroundColor = .orange
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
