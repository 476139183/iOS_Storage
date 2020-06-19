//
//  AnimalCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/19.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class AnimalCell: BaseCell3<AnimalModel> {
    
    override class func cellWith(model: AnimalModel, tableView: UITableView) -> AnimalCell {
        var reuseID = ""
        switch model.type {
        case .cat:
            reuseID = "cat"
        case .dog:
            reuseID = "dog"
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID) as? AnimalCell
        if cell == nil {
            cell = AnimalCell.createCellWith(type: model.type, reuseID: reuseID)
        }
        cell?.model = model
        return cell!
    }
    
    // 简单工厂
    class func createCellWith(type: AnimalModel.AnimalType, reuseID: String) -> AnimalCell {
        switch type {
        case .cat:
            return CatCell.init(style: .default, reuseIdentifier: reuseID)
        case .dog:
            return DogCell.init(style: .default, reuseIdentifier: reuseID)
        }
    }
    
}

class CatCell: AnimalCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func configModel(_ model: AnimalModel) {
        nameLabel.text = model.name
    }
    
    override func configUI() {
        contentView.backgroundColor = .blue
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
}

class DogCell: AnimalCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func configModel(_ model: AnimalModel) {
        nameLabel.text = model.name
    }
    
    override func configUI() {
        contentView.backgroundColor = .red
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
    }
    
}
