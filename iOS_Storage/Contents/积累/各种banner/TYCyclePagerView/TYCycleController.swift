//
//  TYCycleController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TYCycleController: CQBaseViewController, TYCyclePagerViewDataSource, TYCyclePagerViewDelegate {
    
    private lazy var pagerView: TYCyclePagerView = {
        let pager = TYCyclePagerView()
        //pager.layer.borderWidth = 1
        pager.isInfiniteLoop = true
        pager.autoScrollInterval = 3
        pager.dataSource = self
        pager.delegate = self
        pager.register(TYCyclePagerViewCell.self, forCellWithReuseIdentifier: "cellID")
        return pager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(pagerView)
        pagerView.snp.makeConstraints { (make) in
            make.centerY.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
        
    }
    
    func numberOfItems(in pageView: TYCyclePagerView) -> Int {
        3
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cellID", for: index) as? TYCyclePagerViewCell
        cell?.backgroundColor = .blue
        cell?.label.text = "\(index)"
        return cell!
    }
    
    func layout(for pageView: TYCyclePagerView) -> TYCyclePagerViewLayout {
        let layout = TYCyclePagerViewLayout()
        layout.itemSize = .init(width: screenWidth*0.8, height: 120)
        layout.itemSpacing = 15
        layout.itemHorizontalCenter = true
        return layout
    }

}
