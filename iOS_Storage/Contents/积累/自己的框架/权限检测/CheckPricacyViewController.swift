//
//  CheckPricacyViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/14.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import AVFoundation

class CheckPricacyViewController: SelectorListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [SelectorModel(title: "检查相机权限", selector: #selector(checkCamera))]
        
    }
    
    /// 检查相机权限
    @objc private func checkCamera() {
        CQPrivacyManager.checkCameraAuthorizationStatusAuthorized({
            SVProgressHUD.showInfo(withStatus: "已授权")
        }, deniedOrRestricted: {
            SVProgressHUD.showInfo(withStatus: "拒绝或被限制")
        }) {
            SVProgressHUD.showInfo(withStatus: "未决定")
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted) in
                if granted {
                    SVProgressHUD.showInfo(withStatus: "用户点击授权")
                }
            })
        }
    }
    
}
