//
//  SectionModel.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

/// HM 表示 HeaderModel，FM 表示 FooterModel，CM 表示 CellModel
class SectionModel<HM: Any, FM: Any, CM: Any> {
    
    /// header 数据
    var headerModel: HM?
    /// footer 数据
    var footerModel: FM?
    /// cell 数据
    var cellModels: [CM]?
    
    init(headerModel: HM? = nil, footerModel: FM? = nil, cellModels: [CM]? = nil) {
        self.headerModel = headerModel
        self.footerModel = footerModel
        self.cellModels = cellModels
    }
    
}
