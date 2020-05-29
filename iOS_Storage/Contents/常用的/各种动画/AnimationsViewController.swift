//
//  AnimationsViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class AnimationsViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "tableView动画", targetVC: TableViewAnimationViewController()),
                          ItemModel(title: "UIView动画", targetVC: UIViewAnimationViewController()),
                          ItemModel(title: "播放动画", targetVC: GifViewController()),
                          ItemModel(title: "水波动画", targetVC: CQRippleViewController())]
        
    }
    
}
