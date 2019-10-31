//
//  StandardSwiftCollectionViewCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StandardSwiftCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .blue
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .orange
            } else {
                contentView.backgroundColor = .blue
            }
        }
    }
    
}
