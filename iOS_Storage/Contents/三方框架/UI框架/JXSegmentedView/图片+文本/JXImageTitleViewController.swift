//
//  JXImageTitleViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import JXSegmentedView

class JXImageTitleViewController: CQBaseViewController, JXSegmentedViewDelegate,JXSegmentedListContainerViewDataSource {
    
    private lazy var controllers: [JXSegmentedDemoBaseController] = {
        return [JXSegmentedChildController1(), JXSegmentedChildController2(), JXSegmentedChildController3()]
    }()
    
    private lazy var titles: [String] = {
        return ["", "数字2", ""]
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
        return segmentedView
    }()
    
    /// segmentedView的数据源
    private lazy var segmentedDataSource: JXSegmentedTitleImageDataSource = {
        let dataSource = JXSegmentedTitleImageDataSource()
        dataSource.isTitleColorGradientEnabled = true
        dataSource.titleImageType = .rightImage
        //dataSource.titleImageType = .bottomImage
        dataSource.isImageZoomEnabled = true
        dataSource.titles = self.titles
        dataSource.titleNormalFont = .boldSystemFont(ofSize: 14)
        dataSource.titleSelectedFont = .boldSystemFont(ofSize: 16)
        dataSource.normalImageInfos = self.images
        dataSource.imageSelectedZoomScale = 1.3
        dataSource.imageSize = CGSize(width: 30, height: 30)
        dataSource.titleImageSpacing = 5
        dataSource.itemSpacing = 20
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
