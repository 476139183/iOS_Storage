//
//  TextureLabelView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TextureLabelView: UIView {
    
    let label = UILabel()
    
    var content: String? {
        didSet {
            self.label.text = self.content
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .orange
        
        addSubview(label)
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = .yellow
        label.numberOfLines = 0
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10))
        }
    }
    
}
