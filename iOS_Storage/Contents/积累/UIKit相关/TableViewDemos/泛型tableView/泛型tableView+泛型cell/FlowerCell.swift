//
//  FlowerCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class FlowerCell: BaseGenericsCell<FlowerModel> {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var flowerImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override func configModel(model: FlowerModel) {
        nameLabel.text = model.name
        flowerImageView.image = model.image
    }
    
    override func configUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(flowerImageView)
        
        flowerImageView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(100)
            make.centerY.equalToSuperview()
        }
        
    }

}
