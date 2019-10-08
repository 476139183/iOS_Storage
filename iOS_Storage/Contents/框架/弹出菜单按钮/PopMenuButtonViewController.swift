//
//  PopMenuButtonViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/8.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class PopMenuButtonViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let popButton = PopMenuView()
        view.addSubview(popButton)
        popButton.backgroundColor = .orange
        popButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-150)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        
        popButton.postButtonClickedClosuere = {
            print("发帖回调")
        }
        
        popButton.identifyButtonClickedClosuere = {
            print("鉴别回调")
        }
        
        popButton.tradeButtonClickedClosure = {
            print("交易回调")
        }
        
    }
    
}
