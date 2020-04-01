//
//  SideMenuViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/1.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuViewController: CQBaseViewController {
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "location"), for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(menuButtonClicked), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(menuButton)
        menuButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.leading.equalTo(20)
            make.top.equalTo(90)
        }
    }
    
    @objc private func menuButtonClicked() {
        let menu = SideMenuNavigationController(rootViewController: MenuViewController())
        menu.leftSide = true
        present(menu, animated: true, completion: nil)
    }

}


fileprivate class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
    
}
