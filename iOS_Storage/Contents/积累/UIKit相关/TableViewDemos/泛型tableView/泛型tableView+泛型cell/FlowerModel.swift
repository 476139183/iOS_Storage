//
//  FlowerModel.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

class FlowerModel: BaseModel {
    
    var name: String
    var image: UIImage
    
    init(name: String, image: String) {
        self.name = name
        self.image = UIImage.init(named: image)!
    }
    
}

