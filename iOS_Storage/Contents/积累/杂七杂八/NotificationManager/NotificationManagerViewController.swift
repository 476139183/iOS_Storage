//
//  NotificationManagerViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class NotificationManagerViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenterManager.add(observer: self, selector: #selector(ss), name: User2.didLoginSuccessNotification)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenterManager.post(name: User2.didLoginSuccessNotification)
    }

    
    @objc private func ss() {
        print("notif")
    }
    
}
