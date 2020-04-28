//
//  NavigationJumpViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class NavigationJumpViewController: SelectorListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [SelectorModel(title: "跳转到一个新VC", selector: #selector(showNewController)),
                          SelectorModel(title: "弹弹窗", selector: #selector(showAlertVC))]
    }
    
    
    // MARK: - Action
    
    /// 跳转一个新的controller
    @objc private func showNewController() {
        let targetVC = UIViewController()
        targetVC.title = "目标VC"
        targetVC.view.backgroundColor = .yellow
        
        if let window = UIApplication.shared.delegate?.window {
            if let rootTabBar = window?.rootViewController as? UITabBarController?, let naviVC = rootTabBar?.selectedViewController as? UINavigationController {
                naviVC.pushViewController(targetVC, animated: true)
            }
        }
        
    }
    
    /// 跳转一个AlertVC
    @objc private func showAlertVC() {
        let alertVC = UIAlertController(title: "请选择", message: "呵呵哒", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "确定", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertVC.addAction(confirmAction)
        alertVC.addAction(cancelAction)
        
        if let window = UIApplication.shared.delegate?.window {
            if let rootTabBar = window?.rootViewController as? UITabBarController?, let currentVC = rootTabBar?.selectedViewController {
                currentVC.present(alertVC, animated: true, completion: nil)
            }
        }
    }
    
    /// 跳转到系统设置
    @objc private func jumpToSystemSetting() {
        
    }

}
