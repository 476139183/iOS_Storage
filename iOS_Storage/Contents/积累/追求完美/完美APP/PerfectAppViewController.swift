//
//  PerfectAppViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/1/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class PerfectAppViewController: DisplayListViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.textArray = ["1.不仅顶部要适配刘海屏，底部也要适配刘海屏",
                          "2.热点导致状态栏的变化",
                          "3.异常情况的适配，如无网络、请求失败、空列表占位图的显示。",
                          "4.进入一个页面时，请求数据的时候不应该展示占位图。（很多人没有处理这个，导致占位图闪现）",
                          "5.不要忽略按钮和cell按下时的背景颜色。（这个很细，我所呆过的公司只有一家考虑了这种情况）",
                          "6.能用 IconFont 就用 IconFont，这将极大的减小图标的体积。",
                          "7.先请求完数据再跳转新页面，还是跳转到新页面再在新页面请求数据，有一些特殊页面，先请求数据再进去，直接展示内容。",
                          "8.使用loading时，注意loading的覆盖区域，是否需要覆盖返回按钮？是否阻断用户交互？是否阻断返回手势？"]
       
    }
    

}
