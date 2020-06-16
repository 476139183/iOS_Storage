//
//  BaseGenericsModel.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

protocol BaseModel {
    
}

protocol BaseTableViewData {
    func item<T>(indexPath: IndexPath) -> T
    func sectionCount() -> UInt
}

extension Array: BaseModel {
    
    func sectionCount() {
        
    }
    
    func item<T>(indexPath: IndexPath) -> T {
        guard let el = self[indexPath.row] as? T else{
            fatalError("invalid array type")
        }
        return el
    }
    
}
