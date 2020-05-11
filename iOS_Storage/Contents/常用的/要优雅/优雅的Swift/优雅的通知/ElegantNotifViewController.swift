//
//  ElegantNotifViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/11.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ElegantNotifViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.detailUrl = ""
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotif), name: UserModel.didLogInNotification, object: nil)
        
        
        let notifButton = UIButton(type: .system)
        view.addSubview(notifButton)
        notifButton.setTitle("发送通知", for: .normal)
        notifButton.addTarget(self, action: #selector(handleNotif), for: .touchUpInside)
        notifButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
    }
    
    @objc private func postNotif() {
        NotificationCenter.default.post(name: Notification.Name.userDidLogIn, object: nil)
        NotificationCenter.default.post(name: UserModel.didLogInNotification, object: nil)
        
        // 老版本
        //NotificationCenter.default.addObserver(self, selector: #selector(handleNotif), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
    }
    
    @objc private func handleNotif() {
        print("接收到通知")
    }

}


extension Notification.Name {
    static let userDidLogIn = Notification.Name(rawValue: "Notification.Name.userDidLogIn")
}


class UserModel {
    
}

