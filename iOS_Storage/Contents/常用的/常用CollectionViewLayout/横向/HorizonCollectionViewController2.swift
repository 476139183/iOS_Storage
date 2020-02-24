//
//  HorizonCollectionViewController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class HorizonCollectionViewController2: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .orange
        
        let calendarView = SneakersCalendarSegmentView()
        view.addSubview(calendarView)
        
        calendarView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(90)
            make.height.equalTo(40)
        }
        
        calendarView.titles = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"]
        calendarView.selectedIndex = 5
        calendarView.cellSelectedClosure = { [weak self] (index) in
            print(index)
        }
        
    }
    
    deinit {
        print("释放")
    }

}
