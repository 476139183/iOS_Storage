//
//  DateTimePickerViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class DateTimePickerViewController: CQBaseViewController {
    
    let picker = UIDatePicker.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(picker)
        picker.timeZone = NSTimeZone.system
        picker.datePickerMode = .dateAndTime
        picker.addTarget(self, action: #selector(pickerValueChanged), for: .valueChanged)
        picker.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(400)
        }
        
    }
    
    @objc private func pickerValueChanged() {
        let interval = picker.date.timeIntervalSinceNow
        print(interval)
    }
    
}
