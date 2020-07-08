//
//  SwiftUIDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/5.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import SwiftUI

class SwiftUIDemosViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "SF Symbols", targetVC: BaseHostingController(rootView: SFSymbolsView())),
                          ItemModel(title: "基础控件", targetVC: BaseHostingController(rootView: SwiftUIBasicView())),
                          ItemModel(title: "Form", targetVC: BaseHostingController(rootView: SwiftUIFormView())),
                          ItemModel(title: "List", targetVC: BaseHostingController(rootView: SwiftUIListView())),
                          ItemModel(title: "Landmarks", targetVC: BaseHostingController(rootView: LandmarksView()))]
        
    }
    
}
