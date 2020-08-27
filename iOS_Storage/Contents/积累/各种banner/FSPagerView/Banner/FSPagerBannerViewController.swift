//
//  FSPagerBannerViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import FSPagerView

class FSPagerBannerViewController: CQBaseViewController, FSPagerViewDataSource, FSPagerViewDelegate {
    
    fileprivate let imageNames = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"]
    
    private lazy var pagerView: FSPagerView = {
        let pager = FSPagerView()
        pager.register(MyPagerCell.self, forCellWithReuseIdentifier: MyPagerCell.className)
        pager.dataSource = self
        pager.delegate = self
        pager.isInfinite = true
        return pager
    }()
    
    private lazy var pageControl:FSPageControl = {
        let control = FSPageControl()
        control.numberOfPages = self.imageNames.count
        control.contentHorizontalAlignment = .center
        control.setFillColor(.red, for: .selected)
        control.setFillColor(.green, for: .normal)
        return control
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        view.addSubview(pagerView)
        pagerView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(150)
        }
        
        pagerView.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
        }
        
    }
    
    // MARK: - FSPagerView DataSource
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: MyPagerCell.className, at: index)
        cell.imageView?.image = UIImage.init(named: self.imageNames[index])
        return cell
    }
    
    
    // MARK: - FSPagerView Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
        print(index)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }

}

/// 自定义cell
fileprivate class MyPagerCell: FSPagerViewCell {
    
    let redView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 加一个 redView
        contentView.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(30)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.bringSubviewToFront(redView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
