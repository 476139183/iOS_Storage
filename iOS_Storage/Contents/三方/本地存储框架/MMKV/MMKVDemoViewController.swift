//
//  MMKVDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/1.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class MMKVDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.detailUrl = "https://github.com/Tencent/MMKV/blob/master/readme_cn.md"
        
        let mmkv = MMKV.default()!
        
        mmkv.set(true, forKey: "isBoy")
        print(mmkv.bool(forKey: "isBoy"))
        
        
        
        // TODO: - 存储对象
//        let boy = Boy.init()
//        boy.name = "Jack"
//
//        mmkv.set(boy, forKey: "boy")
        
    }

}

extension MMKV {
    
    func set(customObj: Any, forKey: String) {
        
    }
    
    func setCustomObject(obj: Any) {
        
    }
    
}
