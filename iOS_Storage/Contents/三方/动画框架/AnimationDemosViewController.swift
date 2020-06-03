//
//  AnimationDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class AnimationDemosViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "Lottie", targetVC: LottieViewController()),
                          ItemModel(title: "Hero", targetVC: HeroViewController()),
                          ItemModel(title: "Spring", targetVC: SpringViewController())]
        
    }
    
}
