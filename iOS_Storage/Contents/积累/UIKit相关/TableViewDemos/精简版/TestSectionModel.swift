//
//  TestSectionModel.swift
//  rebate
//
//  Created by 刘磊 on 2020/8/24.
//  Copyright © 2020 dingstock. All rights reserved.
//

import Foundation

class TestSectionModel<HM: Any, FM: Any, CM: Any> {
    
    /// cell 数据
    var cellModels: [CM]?
    /// header 数据
    var headerModel: HM?
    /// footer 数据
    var footerModel: FM?
    
    init(cellModels: [CM]? = nil, headerModel: HM? = nil, footerModel: FM? = nil) {
        self.cellModels = cellModels
        self.headerModel = headerModel
        self.footerModel = footerModel
    }
    
}
