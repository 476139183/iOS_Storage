//
//  StrengthModuleViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/28.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StrengthModuleViewController: CQBaseViewController {
    
    // 属性可以这样写
    private lazy var headImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 把相关代码包裹起来
        let mainTableView: UITableView = {
            let tableView = UITableView()
            tableView.dataSource = self
            tableView.delegate = self
            let headerView = UIView.init(frame: .init(x: 0, y: 0, width: kScreenWidth, height: 50))
            headerView.backgroundColor = .red
            tableView.tableHeaderView = headerView
            let footerView = UIView.init(frame: .init(x: 0, y: 0, width: kScreenWidth, height: 60))
            footerView.backgroundColor = .green
            tableView.tableFooterView = footerView
            return tableView
        }()
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
        }
        
//        let imageView: UIImageView = {
//            let imageView = UIImageView()
//            imageView.image = UIImage.init(named: "iu")
//            imageView.kf.setImage(with: URL.init(string: "ss"))
//            return imageView
//        }()
//        view.addSubview(imageView)
//        imageView.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(100)
//        }
        
    }

}


// 代理方法可以写在 extension 里面
extension StrengthModuleViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

// 模块代码都可以用 extension 包起来

// MARK: - Action
extension StrengthModuleViewController {
    
    @objc private func loginButtonClicked() {
        
    }
    
    @objc private func registerButtonClicked() {
        
    }
    
    @objc private func sendCodeButtonClicked() {
        
    }
    
}

// extension 与 // MARK: 搭配使用更香

// 不需要暴露出去的类，并且当这个类代码量比较少时，可以直接写在当前类文件中，用 filePrivate 修饰

/// 导航栏
fileprivate class NaviView: UIView {
    
    // xxx
    
}
