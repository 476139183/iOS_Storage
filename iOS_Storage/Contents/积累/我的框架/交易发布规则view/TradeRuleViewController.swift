//
//  TradeRuleViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/11.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TradeRuleViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let key = "cq_readed_trade_rule"
        let isReaded = UserDefaults.standard.string(forKey: key)
        // 判断UserDefaults中是否已经存在
        if (isReaded == nil){
            // 未读，展示弹窗
            let ruleView = TradeRuleView.init(frame: self.view.bounds)
            view.addSubview(ruleView)
            
            UserDefaults.standard.set(true, forKey: key)
        }
    }
    
}
