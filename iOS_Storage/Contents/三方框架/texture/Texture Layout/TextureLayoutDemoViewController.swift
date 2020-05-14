//
//  TextureLayoutDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/2.
//  Copyright © 2019 蔡强. All rights reserved.
//

// 两个概念
// 1. Layout Specs（布局规则）
// 2. Layout Elements（布局元素，specs也是元素）

import UIKit

class TextureLayoutDemoViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        dataArray = [ItemModel(title: "WrapperLayout", targetVC: ASWrapperLayoutController()),
                     ItemModel(title: "StackLayout", targetVC: ASStackLayoutController()),
                     ItemModel(title: "InsetLayout", targetVC: ASInsetLayoutController()),
                     ItemModel(title: "OverlayLayout", targetVC: ASOverlayLayoutController()),
                     ItemModel(title: "BackgroundLayout", targetVC: ASBackgroundLayoutController()),
                     ItemModel(title: "CenterLayout", targetVC: ASCenterLayoutController()),
                     ItemModel(title: "RatioLayout", targetVC: ASRatioLayoutController()),
                     ItemModel(title: "RelativeLayout", targetVC: ASRelativeLayoutController()),
                     ItemModel(title: "AbsoluteLayout", targetVC: ASAbsoluteLayoutController())]
    }
    
}
