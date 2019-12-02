//
//  NestedTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import JXSegmentedView
import MJRefresh

class NestedTableViewController: CQBaseViewController {
    
    /// 表头高度
    private let kTableHeaderViewHeight: Int = 200
    /// segment高度
    private let kSegmentedViewHeight: Int = 40
    private let titles = ["列表", "网页", "controller", "texture"]
    
    /// 子列表
    private lazy var pagingView: JXPagingView = {
        let pagingView = JXPagingView(delegate: self)
        pagingView.mainTableView.mj_header = DSRefreshHeader(refreshingTarget: self, refreshingAction: #selector(pullDownRefresh))
        return pagingView
    }()
    
    /// 表头
    private lazy var headerView: NestedTableHeaderView = {
        let headerView = NestedTableHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: Int(kScreenWidth), height: kTableHeaderViewHeight)
        return headerView
    }()
    
    /// 分栏
    private lazy var segmentedView: JXSegmentedView = {
        let view = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: Int(kScreenWidth), height: kSegmentedViewHeight))
        view.isContentScrollViewClickTransitionAnimationEnabled = false
        view.contentScrollView = pagingView.listContainerView.collectionView
        view.dataSource = segmentedDataSource
        return view
    }()
    
    /// 分栏数据源
    private lazy var segmentedDataSource: JXSegmentedTitleDataSource = {
        let segmentedViewDataSource = JXSegmentedTitleDataSource()
        segmentedViewDataSource.titles = titles
        segmentedViewDataSource.titleSelectedColor = UIColor(red: 105/255, green: 144/255, blue: 239/255, alpha: 1)
        segmentedViewDataSource.titleNormalColor = UIColor.black
        segmentedViewDataSource.isTitleColorGradientEnabled = true
        segmentedViewDataSource.isTitleZoomEnabled = true
        return segmentedViewDataSource
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pagingView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pagingView.frame = CGRect(x: 0, y: kNavigationBarHeight, width: kScreenWidth, height: kScreenHeight - kNavigationBarHeight - kTabBarHeight)
    }
    
    
    // MARK: - action
    
    @objc private func pullDownRefresh() {
        Loading.show()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.pagingView.mainTableView.mj_header.endRefreshing()
            Loading.remove()
        }
    }

}


// MARK: - JXPagingView Delegate

extension NestedTableViewController: JXPagingViewDelegate {

    func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int {
        return kTableHeaderViewHeight
    }

    func tableHeaderView(in pagingView: JXPagingView) -> UIView {
        return headerView
    }

    func heightForPinSectionHeader(in pagingView: JXPagingView) -> Int {
        return kSegmentedViewHeight
    }

    func viewForPinSectionHeader(in pagingView: JXPagingView) -> UIView {
        return segmentedView
    }

    func numberOfLists(in pagingView: JXPagingView) -> Int {
        return titles.count
    }

    func pagingView(_ pagingView: JXPagingView, initListAtIndex index: Int) -> JXPagingViewListViewDelegate {
        if index == 0 {
            let list = NestedItemTableView()
            return list
        } else if index == 1 {
            let list = NestedItemWebView()
            return list
        } else if index == 2 {
            let list = NestedItemController()
            return list
        } else {
            let list = NestedItemTextureController()
            return list
        }
    }
    
}
