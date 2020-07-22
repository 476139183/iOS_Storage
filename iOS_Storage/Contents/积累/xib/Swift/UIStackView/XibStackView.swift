//
//  XibStackView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class XibStackView: UIView {

    
    @IBOutlet weak var stackView: UIStackView!
    
    /// stackView 把 superView 撑开
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for i in 0...4 {
            let label = UILabel()
            label.text = "fhdjafhjaskfjaskl的哈弗hihi都爱发风好大；发货单批爱好发货地阿评分hi奥"
            label.font = .boldSystemFont(ofSize: 20)
            label.numberOfLines = 0
            
            stackView.addArrangedSubview(label)
        }
        
    }
    
}
