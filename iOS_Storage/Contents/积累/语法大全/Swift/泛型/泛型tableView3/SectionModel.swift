//
//  SectionModel.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

/// HM 表示 HeaderModel，CM 表示 CellModel
class SectionModel<HM: BaseModel3, CM: BaseModel3> {
    
    /// header 数据
    var headerModel: HM?
    /// cell 数据
    var cellModels: [CM]?
    
    init(headerModel: HM?, cellModels: [CM]?) {
        self.headerModel = headerModel
        self.cellModels = cellModels
    }
    
}
