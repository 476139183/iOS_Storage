//
//  AlamofireDownloadViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class AlamofireDownloadViewController: CQBaseViewController {
    
    let downloadUrl = "http://dldir1.qq.com/qqfile/QQforMac/QQ_V6.5.5.dmg"
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("download", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "下载"
        
    }
    
    
    /// 后台下载
    @objc func downloadInBackground() {
        print("后台下载")
        
        
        
    }

}
