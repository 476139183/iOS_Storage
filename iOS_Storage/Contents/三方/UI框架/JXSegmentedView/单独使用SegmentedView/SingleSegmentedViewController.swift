//
//  SingleSegmentedViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/21.
//  Copyright © 2020 蔡强. All rights reserved.
//
//  单独使用SegmentedView

import UIKit
import JXSegmentedView

class SingleSegmentedViewController: CQBaseViewController, JXSegmentedViewDelegate {
    
    private let vc1 = JXSegmentedChildController1()
    
    private lazy var controllers: [JXSegmentedDemoBaseController] = {
        return [JXSegmentedChildController1(), JXSegmentedChildController2(), JXSegmentedChildController3()]
    }()
    
    private lazy var titles: [String] = {
        return ["11", "22", "33"]
    }()
    
    private lazy var segmentedView: JXSegmentedView = {
        let segmentedView = JXSegmentedView()
        segmentedView.delegate = self
        segmentedView.dataSource = self.segmentedDataSource
        segmentedView.backgroundColor = .orange
        
        let indicator = JXSegmentedIndicatorBackgroundView()
        indicator.indicatorHeight = 30
        segmentedView.indicators = [indicator]
        
        return segmentedView
    }()
    
    /// segmentedView的数据源
    private lazy var segmentedDataSource: JXSegmentedTitleDataSource = {
        let segmentedDataSource = JXSegmentedTitleDataSource()
        segmentedDataSource.titles = ["11", "22", "33"]
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.titleSelectedFont = .boldSystemFont(ofSize: 20)
        segmentedDataSource.titleNormalFont = .systemFont(ofSize: 15)
        segmentedDataSource.titleSelectedColor = .black
        segmentedDataSource.titleNormalColor = .gray
        segmentedDataSource.isTitleMaskEnabled = true
        return segmentedDataSource
    }()
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(segmentedView)
        addChild(vc1)
        view.addSubview(vc1.view)
        
        segmentedView.snp.makeConstraints { (make) in
            make.top.equalTo(90)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        vc1.view.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    // MARK: - Delegate
    
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        print(titles[index])
    }

}
