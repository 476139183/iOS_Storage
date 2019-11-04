//
//  JXImageOrTextViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import JXSegmentedView

class JXImageOrTextViewController: CQBaseViewController, JXSegmentedViewDelegate, JXSegmentedListContainerViewDataSource {
    
    private lazy var controllers: [JXSegmentedDemoBaseController] = {
        return [JXSegmentedChildController1(), JXSegmentedChildController2(), JXSegmentedChildController3()]
    }()
    
    private lazy var titles: [String] = {
        return ["数组1", "数字2", "数字3"]
    }()
    
    private lazy var images: [String] = {
        return ["number_1", "number_2", "number_3"]
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
    private lazy var segmentedDataSource: JXSegmentedTitleOrImageDataSource = {
        let dataSource = JXSegmentedTitleOrImageDataSource()
        dataSource.isTitleColorGradientEnabled = true
        dataSource.titleSelectedColor = UIColor.red
        dataSource.isTitleZoomEnabled = true
        dataSource.titleSelectedZoomScale = 1.3
        dataSource.isTitleStrokeWidthEnabled = true
        dataSource.isItemTransitionEnabled = false
        dataSource.isSelectedAnimable = true
        dataSource.titles = titles
        dataSource.selectedImageInfos = self.images
        return dataSource
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
        return images.count
    }
    
    
    // MARK: - Delegate
    
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        //        titles.append("555")
        //        segmentedDataSource.titles = self.titles
        //        controllers.append(JXSegmentedChildController1())
        //        segmentedView.reloadData()
        //        segmentedView.listContainer?.reloadData()
        print(images[index])
    }

}
