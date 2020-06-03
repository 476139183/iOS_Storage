//
//  MultiThreadController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MultiThreadController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "pthread", targetVC: CQPthreadController()),
                          ItemModel.init(title: "NSThread", targetVC: CQThreadViewController()),
                          ItemModel.init(title: "NSOperation", targetVC: CQOperationController()),
                          ItemModel.init(title: "GCD", targetVC: CQGCDController()),
                          ItemModel.init(title: "请求多个接口", targetVC: CQMultiInterfaceViewController()),
                          ItemModel.init(title: "锁", targetVC: CQLockViewController()),
                          ItemModel.init(title: "在block里return方法", targetVC: CQBlockReturnViewController()),
                          ItemModel.init(title: "在closure里return方法", targetVC: ClosureReturnViewController())]
    }

}
