//
//  CountDownButtonViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/14.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class CountDownButtonViewController: CQBaseViewController {
    
    let countDownButton = CQCountDownButton.init()
    
    deinit {
        print("已释放")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.countDownButton.frame = CGRect.init(x: 150, y: 200, width: 100, height: 40);
        self.view.addSubview(self.countDownButton)
        self.countDownButton.setTitle("点击开始", for: .normal)
        self.countDownButton.setTitleColor(UIColor.blue, for: .normal)
        self.countDownButton.setTitleColor(UIColor.gray, for: .disabled)
        self.countDownButton.configDuration(10, buttonClicked: { [weak self] () in
            // 按钮点击
            self?.countDownButton.startCountDown()
        }, countDownStart: {
            // 开始倒计时
            print("开始")
        }, countDownUnderway: { [weak self] rest in
            // 倒计时进行中
            self?.countDownButton.setTitle(String(rest)+"秒结束", for: .normal)
        }) { [weak self] () in
            // 倒计时结束
            self?.countDownButton.setTitle("点击开始", for: .normal)
        };
    }
    

}
