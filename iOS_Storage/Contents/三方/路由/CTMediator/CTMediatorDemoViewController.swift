//
//  CTMediatorDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CTMediatorDemoViewController: SelectorListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [SelectorModel(title: "push", selector: #selector(ctMediatorPush)),
                          SelectorModel(title: "present", selector: #selector(ctMediatorPresent)),
                          SelectorModel(title: "本地组件调用", selector: #selector(ctMediatorAction)),
                          SelectorModel(title: "处理URL", selector: #selector(handleURL))]
        
    }
    
    // MARK: -
    
    @objc private func ctMediatorPush() {
        let vc = CQBaseViewController()
        vc.title = "push"
        vc.view.backgroundColor = .orange
        CTMediator.sharedInstance().push(vc, animated: true)
    }
    
    // MARK: -
    
    @objc private func ctMediatorPresent() {
        let vc = CQBaseViewController()
        vc.title = "present"
        vc.view.backgroundColor = .orange
        CTMediator.sharedInstance().present(vc, animated: true) {
            
        }
    }
    
    // MARK: -
    
    @objc private func ctMediatorAction() {
        CTMediator.sharedInstance().performTarget("dog", action: "run", params: nil, shouldCacheTarget: false)
    }
    
    // MARK: -
    
    @objc private func handleURL() {
        var url = "https://app.dingstock.net/lab/index?minVer=1.6.4"
        url = url.replacingOccurrences(of: "https://app.dingstock.net/", with: "DingStock://")
        CTMediator.sharedInstance().performAction(with: URL.init(string: url), completion: nil)
    }
    
}


class Target_dog: NSObject {
    
    @objc func Action_run(_ params: [AnyHashable: Any]?) {
        print("跑起来了")
    }
    
}


class Target_lab: NSObject {
    
    @objc func Action_index(_ params: [AnyHashable: Any]?) {
        print("index")
    }
    
}
