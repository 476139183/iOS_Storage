//
//  FontTestViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class FontTestViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let label1 = UILabel.init(frame: .init(x: 90, y: 90, width: 300, height: 50))
        view.addSubview(label1)
        label1.text = "default"
        label1.font = .systemFont(ofSize: 40)
        
        
        let label2 = UILabel.init(frame: .init(x: 90, y: 150, width: 300, height: 50))
        view.addSubview(label2)
        label2.text = "Papyrus"
        label2.font = UIFont(name: "Papyrus", size: 40)
        
        let label3 = UILabel.init(frame: .init(x: 90, y: 210, width: 300, height: 50))
        view.addSubview(label3)
        label3.text = "futura"
        label3.font = UIFont(name: "futura", size: 40)
        
        let label4 = UILabel.init(frame: .init(x: 90, y: 260, width: 300, height: 50))
        view.addSubview(label4)
        label4.text = "DINAlternate-Bold"
        label4.font = UIFont(name: "DINAlternate-Bold", size: 40)
    }
    
}
