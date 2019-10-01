//
//  YYDemoListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class YYDemoListViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let dataArray = [Model.init(title: "YYText", sel: #selector(gotoYYText)),
                     Model.init(title: "YYTextView", sel: #selector(gotoYYTextView))]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tableView = UITableView.init(frame: view.bounds)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc private func gotoYYText() {
        let vc = YYTextDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoYYTextView() {
        let vc = YYTextViewDemoController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className())
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: UITableViewCell.className())
        }
        cell?.textLabel?.text = dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        perform(dataArray[indexPath.row].sel)
    }

}

fileprivate struct Model {
    var title: String?
    var sel: Selector
}
