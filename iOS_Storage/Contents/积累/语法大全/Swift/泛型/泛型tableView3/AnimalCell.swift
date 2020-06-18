//
//  AnimalCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/19.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class AnimalCell: BaseCell3<AnimalModel> {

    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
