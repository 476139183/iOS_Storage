//
//  CellProtocol.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/29.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

protocol CellProtocol {
    
    var model: PersonCellModel? { get set }
    
    func personDetailButtonClicked()
    
}
