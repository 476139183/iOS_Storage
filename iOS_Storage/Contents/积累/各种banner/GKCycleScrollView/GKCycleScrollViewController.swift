//
//  GKCycleScrollViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GKCycleScrollViewController: CQBaseViewController, GKCycleScrollViewDataSource, GKCycleScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let banner = GKCycleScrollView.init()
        view.addSubview(banner)
        banner.delegate = self
        banner.dataSource = self
        banner.direction = .horizontal
        banner.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(120)
        }
    }
    
    func numberOfCells(in cycleScrollView: GKCycleScrollView!) -> Int {
        return 3
    }
    
    func cycleScrollView(_ cycleScrollView: GKCycleScrollView!, cellForViewAt index: Int) -> GKCycleScrollViewCell! {
        let cell = GKCycleScrollViewCell.init()
        cell.backgroundColor = .red
        cell.setupCellFrame(.init(x: 0, y: 0, width: screenWidth, height: 120))
        cell.imageView.image = UIImage.init(named: "iu_header")
        return cell
    }

}
