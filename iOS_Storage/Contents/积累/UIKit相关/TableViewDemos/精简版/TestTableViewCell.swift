//
//  TestTableViewCell.swift
//  rebate
//
//  Created by 刘磊 on 2020/8/24.
//  Copyright © 2020 dingstock. All rights reserved.
//

import Foundation

class TestTableViewCell: UITableViewCell, ModelBindedView {
    func bindModel(_ model: TestTableCellModel) {
        textLabel?.text = model.title
    }
}
