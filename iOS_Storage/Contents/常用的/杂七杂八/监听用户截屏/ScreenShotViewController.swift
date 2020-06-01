//
//  ScreenShotViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/1.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ScreenShotViewController: CQBaseViewController {
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "你截屏试试"
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleScreenshot(notif:)), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleResignActive), name: UIApplication.willResignActiveNotification, object: nil)
        
    }
    
    @objc private func handleScreenshot(notif: Notification) {
        
        view.backgroundColor = .orange
        
        print("screenShot")
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func handleResignActive() {
        showRedView()
    }
    
    @objc private func handleBecomeActive() {
        hideRedView()
    }
    
    @objc private func showRedView() {
        redView.isHidden = false
        if let window = UIApplication.shared.delegate?.window {
            window?.addSubview(redView)
            redView.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview()
                make.width.height.equalTo(30)
            }
        }
    }
    
    @objc private func hideRedView() {
        redView.isHidden = true
    }

}
