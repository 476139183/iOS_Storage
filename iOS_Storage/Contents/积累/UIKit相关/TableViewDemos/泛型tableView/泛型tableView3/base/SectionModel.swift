//
//  SectionModel.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

/// 一个 section 所对应的 model。
/// 每个 section 包含三部分：cell、组头、组尾。
/// CM 表示 CellModel，HM 表示 HeaderModel，FM 表示 FooterModel
class SectionModel<HM: Any, FM: Any, CM: Any> {
    
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
