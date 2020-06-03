//
//  GestureViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GestureViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "单击手势", targetVC: TapGestureViewController()),
                          ItemModel.init(title: "轻扫手势", targetVC: SwipeGestureViewController()),
                          ItemModel.init(title: "长按手势", targetVC: LongPressGestureViewController()),
                          ItemModel.init(title: "平移手势", targetVC: PanGestureViewController()),
                          ItemModel.init(title: "捏合（缩放）手势", targetVC: PinchGestureViewController()),
                          ItemModel.init(title: "旋转手势", targetVC: RotationGestureViewController()),
                          ItemModel.init(title: "屏幕边缘平移手势", targetVC: ScreenEdgePanGestureViewController()),
                          ItemModel.init(title: "高德pan", targetVC: GaodeMapPanDemoViewController())]
        
    }
    
}
