//
//  MyFrameworkViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class MyFrameworkViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "Swift ActionSheet", targetVC: DSActionSheetController()),
                          ItemModel(title: "各种 Loading", targetVC: LoadingDemosViewController()),
                          ItemModel(title: "Swift 占位图", targetVC: PlaceholderViewController()),
                          ItemModel(title: "弹窗", targetVC: AlertDemoViewController()),
                          ItemModel(title: "跳转到地图APP", targetVC: MapNaviViewController()),
                          ItemModel(title: "权限检测", targetVC: CheckPricacyViewController()),
                          ItemModel(title: "一个很6的倒计时button", targetVC: CountDownButtonViewController()),
                          ItemModel(title: "logo商标识别", targetVC: CQRecognitionViewController()),
                          ItemModel(title: "好用的button", targetVC: EasyButtonDemosController()),
                          ItemModel(title: "弹出菜单按钮", targetVC: PopMenuButtonViewController()),
                          ItemModel(title: "交易发布规格view", targetVC: TradeRuleViewController()),
                          ItemModel(title: "带placeholder的textView", targetVC: PlaceholderTextViewController()),
                          ItemModel(title: "定位", targetVC: LocationManagerViewController()),
                          ItemModel(title: "基于MJRefresh的下拉刷新", targetVC: RefreshViewController()),
                          ItemModel(title: "控制view的状态", targetVC: ChangeViewStateViewController()),
                          ItemModel(title: "动画hud", targetVC: AnimationHudViewController()),
                          ItemModel(title: "历史记录", targetVC: RecordsManagerViewController())]
        
    }

}
