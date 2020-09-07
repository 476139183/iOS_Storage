//
//  TestTableFooter.swift
//  rebate
//
//  Created by 刘磊 on 2020/8/24.
//  Copyright © 2020 dingstock. All rights reserved.
//

import Foundation

class TestTableFooter: UITableViewHeaderFooterView, ModelBindedView {
    func bindModel(_ model: TestTableFooterModel) {
        textLabel?.text = model.title
        contentView.backgroundColor = .orange
    }
}
