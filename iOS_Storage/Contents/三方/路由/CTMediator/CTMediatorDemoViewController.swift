//
//  CTMediatorDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import CTMediator

class CTMediatorDemoViewController: SelectorListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [SelectorModel(title: "push", selector: #selector(ctMediatorPush)),
                          SelectorModel(title: "present", selector: #selector(ctMediatorPresent))]
        
    }
    
    @objc private func ctMediatorPush() {
        let vc = CQBaseViewController()
        vc.title = "push"
        vc.view.backgroundColor = .orange
        CTMediator.sharedInstance().push(vc, animated: true)
    }
    
    @objc private func ctMediatorPresent() {
        let vc = CQBaseViewController()
        vc.title = "present"
        vc.view.backgroundColor = .orange
        CTMediator.sharedInstance().present(vc, animated: true) {
            
        }
    }
    
}
