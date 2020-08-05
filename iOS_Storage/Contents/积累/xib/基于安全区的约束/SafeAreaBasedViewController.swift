//
//  SafeAreaBasedViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SafeAreaBasedViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "上部基于view，下部基于安全区"
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let blueView = SafeAreaBasedBlueView.loadNib()
        view.addSubview(blueView)
        blueView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
    }

}
