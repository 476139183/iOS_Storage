//
//  AnimalModel.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/19.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

class AnimalModel {
    
    enum AnimalType {
        case cat
        case dog
    }
    
    var type: AnimalType = .cat
    var name: String = ""
    
    init(type: AnimalType, name: String) {
        self.type = type
        self.name = name
    }
    
}
