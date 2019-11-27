//
//  NestedTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import JXSegmentedView

class NestedTableViewController: CQBaseViewController {
    
    /// 表头高度
    private let kTableHeaderViewHeight: Int = 200
    /// segment高度
    private let kSegmentedViewHeight: Int = 40
    private let titles = ["列表", "网页"]
    
    private lazy var pagingView: JXPagingView = {
        let pagingView = JXPagingView(delegate: self)
        return pagingView
    }()
    
    /// 表头
    private lazy var headerView: NestedTableHeaderView = {
        let headerView = NestedTableHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: Int(kScreenWidth), height: kTableHeaderViewHeight)
        return headerView
    }()
    
    private lazy var headerContainerView: UIView = {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: Int(kScreenWidth), height: kTableHeaderViewHeight))
        containerView.addSubview(headerView)
        return containerView
    }()
    
    private lazy var segmentedView: JXSegmentedView = {
//        let view = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kSegmentedViewHeight))
        let view = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: Int(kScreenWidth), height: kSegmentedViewHeight))
        view.isContentScrollViewClickTransitionAnimationEnabled = false
        view.contentScrollView = pagingView.listContainerView.collectionView
        view.dataSource = segmentedDataSource
        return view
    }()
    
    private lazy var segmentedDataSource: JXSegmentedTitleDataSource = {
        let segmentedViewDataSource = JXSegmentedTitleDataSource()
        segmentedViewDataSource.titles = titles
        segmentedViewDataSource.titleSelectedColor = UIColor(red: 105/255, green: 144/255, blue: 239/255, alpha: 1)
        segmentedViewDataSource.titleNormalColor = UIColor.black
        segmentedViewDataSource.isTitleColorGradientEnabled = true
        segmentedViewDataSource.isTitleZoomEnabled = true
        return segmentedViewDataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pagingView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pagingView.frame = CGRect(x: 0, y: kNavigationBarHeight, width: kScreenWidth, height: kScreenHeight - kNavigationBarHeight - kTabBarHeight)
    }

}

extension NestedTableViewController: JXPagingViewDelegate {

    func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int {
        return kTableHeaderViewHeight
    }

    func tableHeaderView(in pagingView: JXPagingView) -> UIView {
        return headerContainerView
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
        } else {
            let list = NestedItemWebView()
            return list
        }
    }
    
//    func mainTableViewDidScroll(_ scrollView: UIScrollView) {
////        userHeaderView?.scrollViewDidScroll(contentOffsetY: scrollView.contentOffset.y)
//    }
    
}
