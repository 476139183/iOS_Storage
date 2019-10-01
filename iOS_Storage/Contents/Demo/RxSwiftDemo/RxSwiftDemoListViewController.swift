//
//  RxSwiftDemoListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class RxSwiftDemoListViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let dataArray: [Model] = [Model.init(title: "基本操作", sel: #selector(basic)),
                                      Model.init(title: "登录页", sel: #selector(gotoLoginVC)),
                                      Model.init(title: "高度自适应", sel: #selector(gotoDynamicTableVC))]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    
    // MARK: - action

    @objc private func basic() {
        let vc = RxSwiftDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoLoginVC() {
        let vc = RxSwiftLoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoDynamicTableVC() {
        let vc = RxSwiftDynamicTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - DataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className())
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: UITableViewCell.className())
        }
        cell?.textLabel?.text = self.dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.perform(self.dataArray[indexPath.row].sel)
    }

}


// MARK: -

fileprivate struct Model {
    var title: String?
    var sel: Selector?
}
