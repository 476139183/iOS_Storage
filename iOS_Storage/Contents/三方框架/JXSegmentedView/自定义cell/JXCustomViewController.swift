//
//  JXCustomViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import JXSegmentedView

class JXCustomViewController: CQBaseViewController, JXSegmentedViewDelegate, JXSegmentedListContainerViewDataSource {
    
    private lazy var controllers: [JXSegmentedDemoBaseController] = {
        return [JXSegmentedChildController1(), JXSegmentedChildController2(), JXSegmentedChildController3()]
    }()
    
    private lazy var titles: [String] = {
        return ["数字1", "数字2", "数字3"]
    }()
    
    private lazy var images: [String] = {
        return ["number_1", "", "https://upload.jianshu.io/users/upload_avatars/1692043/89793122f9d1?imageMogr2/auto-orient/strip"]
    }()
    
    private lazy var segmentedView: JXSegmentedView = {
        let segmentedView = JXSegmentedView()
        segmentedView.delegate = self
        segmentedView.dataSource = self.segmentedDataSource
        segmentedView.backgroundColor = .orange
        segmentedView.listContainer = listContainerView
        
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = 12
        indicator.indicatorHeight = 3
        indicator.layer.cornerRadius = 1.5
        indicator.indicatorColor = UIColor.red
        
        segmentedView.indicators = [indicator]
        
        return segmentedView
    }()
    
    /// segmentedView的数据源
    private lazy var segmentedDataSource: HomeSegmentedDataSource = {
        let dataSource = HomeSegmentedDataSource()
        dataSource.isTitleColorGradientEnabled = true
        dataSource.titles = self.titles
        dataSource.titleNormalFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        dataSource.titleSelectedFont = UIFont.systemFont(ofSize: 22, weight: .medium)
        dataSource.titleNormalColor = .gray
        dataSource.titleSelectedColor = .black
        dataSource.titleSelectedZoomScale = 22 / 16
        dataSource.normalImageInfos = self.images
        dataSource.imageSelectedZoomScale = 22 / 16
        dataSource.isImageZoomEnabled = true
        dataSource.isItemTransitionEnabled = true
        dataSource.imageSize = CGSize(width: 30, height: 30)
        dataSource.isTitleZoomEnabled = true
        dataSource.isTitleStrokeWidthEnabled = true
        dataSource.itemSpacing = 28
        // 加载图片
        dataSource.loadImageClosure = {(imageView, normalImageInfo) in
            
            if let image = UIImage(named: normalImageInfo) {
                imageView.image = image
            } else {
                //let url = URL(string: normalImageInfo)
                let string = normalImageInfo.removingPercentEncoding
                let url = URL.init(string: string ?? "")
                imageView.kf.setImage(with: url)
            }
            
        }
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
            make.top.equalTo(kNavigationBarHeight)
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
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
