//
//  AnimationsViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class AnimationsViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let dataArray: [Model] = [Model(title: "tableView动画", sel: #selector(gotoTableViewAnimationVC))]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc private func gotoTableViewAnimationVC() {
        let vc = TableViewAnimationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = dataArray[indexPath.row].title
        return cell!
    }

}

fileprivate struct Model {
    var title: String?
    var sel: Selector?
}
