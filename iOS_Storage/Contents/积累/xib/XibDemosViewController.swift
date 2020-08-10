//
//  XibDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class XibDemosViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "高度自适应系统的状态栏", targetVC: StatusBarAdaptionViewController()),
                          ItemModel(title: "xib stack", targetVC: XibStackViewController()),
                          ItemModel(title: "高度固定的导航栏", targetVC: ConstantNaviController()),
                          ItemModel(title: "基于安全区的约束", targetVC: SafeAreaBasedViewController()),
                          ItemModel(title: "嵌套xib", targetVC: XibInXibViewController()),
                          ItemModel(title: "添加自定义属性", targetVC: SwiftXibCustomPropertyViewController()),
                          ItemModel(title: "可视化圆角", targetVC: XibCornerViewController()),
                          ItemModel(title: "动态修改约束", targetVC: DynamicConstraintViewController1()),
                          ItemModel(title: "自定义view", targetVC: SwiftXibCustomViewController()),
                          ItemModel(title: "scrollView", targetVC: SwiftXibScrollViewController()),
                          ItemModel(title: "scrollView2", targetVC: SwiftXibScrollViewController2()),
                          ItemModel(title: "tableView", targetVC: SwiftXibTableViewController()),
                          ItemModel(title: "collectionView", targetVC: SwiftXibCollectionViewController()),
                          ItemModel(title: "stackView", targetVC: SwiftXibStackController())]
        
    }
    
}
