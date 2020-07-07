//
//  DatePracticeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/31.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class DatePracticeViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let date = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print(dateFormat.string(from: date))
        
    }

}
