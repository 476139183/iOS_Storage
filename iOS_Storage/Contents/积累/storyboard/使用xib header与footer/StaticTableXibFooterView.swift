//
//  StaticTableXibFooterView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/9/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StaticTableXibFooterView: UIView {
    
    var layoutSubviewsClosure: (()->Void)?

    @IBOutlet weak var label: UILabel!
    
    @IBAction func addButtonClicked(_ sender: Any) {
        self.label.text?.append("\n这是表尾")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutSubviewsClosure?()
    }

}
