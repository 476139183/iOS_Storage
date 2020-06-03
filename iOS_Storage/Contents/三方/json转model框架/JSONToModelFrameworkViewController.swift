//
//  JSONToModelFrameworkViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class JSONToModelFrameworkViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "ObjectMapper", targetVC: ObjectMapperDemoViewController()),
                          ItemModel(title: "JSONModel", targetVC: CQJSONModelViewController()),
                          ItemModel(title: "SwiftyJSON", targetVC: SwiftyJSONViewController()),
                          ItemModel(title: "YYModel", targetVC: CQYYModelViewController())]
        
    }

}
