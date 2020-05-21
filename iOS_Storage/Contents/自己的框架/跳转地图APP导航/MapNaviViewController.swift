//
//  MapNaviViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/11.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MapNaviViewController: SelectorListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [SelectorModel(title: "通过坐标导航", selector: #selector(guideWithCoordinate)),
                          SelectorModel(title: "通过地址导航", selector: #selector(guideWithDestination)),
                          SelectorModel(title: "通过“坐标+地址”导航", selector: #selector(guideWithCoordinateAndDestination))]
        
    }
    
    /// 通过坐标导航
    @objc private func guideWithCoordinate() {
        CQRouteManager.presentRouteNaviMenu(on: self, with: CLLocationCoordinate2DMake(30.655942, 104.077104))
    }
    
    /// 通过地址导航
    @objc private func guideWithDestination() {
        CQRouteManager.presentRouteNaviMenu(on: self, withDestination: "天府广场")
    }
    
    /// 通过 坐标+地址 导航
    @objc private func guideWithCoordinateAndDestination() {
        CQRouteManager.presentRouteNaviMenu(on: self, withCoordate: CLLocationCoordinate2DMake(30.655942, 104.077104), destination: "T恤家(春熙北店)")
    }
    
}
