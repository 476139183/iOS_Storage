//
//  VideoDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/23.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class VideoDemoViewController: JumpListViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "MPMoviePlayerController（iOS9已废弃）", targetVC: nil),
                          ItemModel.init(title: "AVPlayerViewController（iOS8之后可用）", targetVC: AVPlayerViewControllerVC()),
                          ItemModel.init(title: "AVPlayer", targetVC: AVPlayerDemoViewController()),
                          ItemModel.init(title: "画中画", targetVC: PictureInPictureViewController()),
                          ItemModel.init(title: "ZFPlayer", targetVC: ZFPlayerDemoViewController()),
                          ItemModel.init(title: "ZFPlayer自带的demo", targetVC: ZFNoramlViewController())]
        
    }
    
    
}
