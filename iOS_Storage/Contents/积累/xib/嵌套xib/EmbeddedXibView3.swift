//
//  EmbeddedXibView3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/6.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

@IBDesignable

class EmbeddedXibView3: BaseXibEmbeddedView {
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBInspectable var title: String = "" {
        didSet {
            self.titleLabel.text = title
        }
    }
    
}
