//
//  TestTableHeader.swift
//  rebate
//
//  Created by 刘磊 on 2020/8/24.
//  Copyright © 2020 dingstock. All rights reserved.
//

import Foundation

class TestTableHeader: UITableViewHeaderFooterView, ModelBindedView {
    func bindModel(_ model: TestTableHeaderModel) {
        textLabel?.text = model.title
        contentView.backgroundColor = .cyan
    }
}
