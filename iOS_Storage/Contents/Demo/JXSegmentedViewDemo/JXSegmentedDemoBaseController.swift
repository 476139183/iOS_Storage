//
//  JXSegmentedDemoBaseController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/22.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import JXSegmentedView

class JXSegmentedDemoBaseController: UIViewController, JXSegmentedListContainerViewListDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func listView() -> UIView {
        return self.view
    }

}
