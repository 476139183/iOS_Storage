//
//  CheckPricacyViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/14.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import AVFoundation

class CheckPricacyViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.frame = self.view.bounds
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellReuseID)
        }
        
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "检查相机权限"
        default:
            break
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
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
        default:
            break;
        }
    }
    
}
