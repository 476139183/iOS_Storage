//
//  StackInXibViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StackInXibViewController: CQBaseViewController {
    
    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for _ in 0...10 {
            let label = UILabel()
            label.text = "sfa的假发票大佛暗黑风发货方酸辣粉；1光谱阿达汇票的发挥iOSadhiof平分配海东方后排"
            label.font = .systemFont(ofSize: 13)
            label.numberOfLines = 0
            label.textColor = .red
            stackView.addArrangedSubview(label)
        }
        
    }
    
}
