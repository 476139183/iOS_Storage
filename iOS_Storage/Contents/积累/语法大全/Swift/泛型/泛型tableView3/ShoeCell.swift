//
//  ShoeCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ShoeCell: BaseCell3<ShoeModel> {
    
    private lazy var shoeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    override func configUI() {
        contentView.addSubview(shoeImageView)
        contentView.addSubview(nameLabel)
        
        shoeImageView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(120)
        }
        
    }
    
    override func configModel(_ model: ShoeModel) {
        shoeImageView.image = UIImage.init(named: model.image)
        nameLabel.text = model.name
    }

}
