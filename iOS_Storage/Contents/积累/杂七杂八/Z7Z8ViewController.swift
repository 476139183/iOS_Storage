//
//  Z7Z8ViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/21.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class Z7Z8ViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "图片压缩", targetVC: CompressImageViewController()),
                          ItemModel(title: "image和text互转", targetVC: ImageTextConvertViewController()),
                          ItemModel(title: "监听用户截屏", targetVC: ScreenShotViewController()),
                          ItemModel(title: "检测controller是否释放", targetVC: CQCheckDeallocViewController()),
                          ItemModel(title: "检测view是否释放", targetVC: CheckViewMemoryLeakViewController()),
                          ItemModel(title: "计算帧率", targetVC: CQFPSViewController()),
                          ItemModel(title: "cache", targetVC: CQCacheDemoViewController()),
                          ItemModel(title: "scrollView截图", targetVC: CaptureScrollViewController()),
                          ItemModel(title: "url转二维码", targetVC: URLToQRCodeController())]
        
    }
    
}
