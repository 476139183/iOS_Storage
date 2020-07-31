//
//  CameraFrameworkViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CameraFrameworkViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "TZImagePickerController单张", targetVC: TZImagePickerDemoController()),
                          ItemModel(title: "TZImagePickerController多张", targetVC: TZImagePickerDemoController2()),
                          ItemModel(title: "CameraManager", targetVC: CameraManagerViewController())]
        
    }

}
