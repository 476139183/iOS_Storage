//
//  UIKitDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class UIKitDemosViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "UILabel", targetVC: UILabelDemosViewController()),
                          ItemModel.init(title: "UIButton", targetVC: UIButtonDemosViewController()),
                          ItemModel.init(title: "UITextField", targetVC: UITextFieldDemosViewController()),
                          ItemModel.init(title: "UITableView", targetVC: TableViewDemosViewController()),
                          ItemModel.init(title: "UICollectionView", targetVC: CollectionViewDemosViewController()),
                          ItemModel.init(title: "UIScrollView", targetVC: UIScrollViewController()),
                          ItemModel.init(title: "UITextView", targetVC: UITextViewDemoController()),
                          ItemModel.init(title: "UIStackView", targetVC: UIStackViewDemoListController()),
                          ItemModel.init(title: "UIPageViewController", targetVC: UIPageViewControllerDemoController()),
                          ItemModel.init(title: "UIPresentationController", targetVC: UIPresentationControllerDemoController()),
                          ItemModel.init(title: "UIActivityViewController", targetVC: UIActivityViewControllerDemoViewController())]
        
    }

}
