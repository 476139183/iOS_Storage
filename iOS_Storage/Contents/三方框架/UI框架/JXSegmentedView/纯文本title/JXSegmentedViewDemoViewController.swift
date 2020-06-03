//
//  JXSegmentedViewDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/19.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import JXSegmentedView

class JXSegmentedViewDemoViewController: CQBaseViewController, JXSegmentedViewDelegate, JXSegmentedListContainerViewDataSource {
    
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
        segmentedView.listContainer = listContainerView
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
        return segmentedDataSource
    }()
    
    private lazy var listContainerView: JXSegmentedListContainerView = {
        let listContainerView = JXSegmentedListContainerView(dataSource: self)
        return listContainerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(segmentedView)
        view.addSubview(listContainerView)
        
        segmentedView.snp.makeConstraints { (make) in
            make.top.equalTo(90)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        listContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    
    // MARK: - DataSource
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        let vc = controllers[index]
        return vc
    }
    
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return titles.count
    }
    
    
    // MARK: - Delegate
    
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
//        titles.append("555")
//        segmentedDataSource.titles = self.titles
//        controllers.append(JXSegmentedChildController1())
//        segmentedView.reloadData()
//        segmentedView.listContainer?.reloadData()
        print(titles[index])
    }

}
