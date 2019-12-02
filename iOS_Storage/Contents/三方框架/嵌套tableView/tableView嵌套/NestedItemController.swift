//
//  NestedItemController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import MJRefresh

class NestedItemController: UIViewController, UIScrollViewDelegate, JXPagingViewListViewDelegate {
    
    var listViewDidScrollCallback: ((UIScrollView) -> ())?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.backgroundColor = .orange
        scrollView.contentSize = CGSize(width: kScreenWidth, height: 1000)
        scrollView.mj_footer = MJRefreshBackFooter(refreshingBlock: {
            print("刷新")
        })
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(scrollView)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
    }
    
    
    // MARK: - UIScrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.listViewDidScrollCallback?(scrollView)
    }
    
    
    // MARK: - JXPagingViewListView Delegate
    
    func listView() -> UIView {
        return view
    }
    
    func listScrollView() -> UIScrollView {
        return scrollView
    }
    
    func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ()) {
        self.listViewDidScrollCallback = callback
    }

}
