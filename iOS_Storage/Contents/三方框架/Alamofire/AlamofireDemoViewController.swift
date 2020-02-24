//
//  AlamofireDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/3.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class AlamofireDemoViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var dataArray: [Model] = {
        return [Model(title: "普通请求", targetVC: AlamofireRequestViewController()),
                Model(title: "上传", targetVC: AlamofireUploadViewController()),
                Model(title: "下载", targetVC: AlamofireDownloadViewController())]
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = self.dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(self.dataArray[indexPath.row].targetVC, animated: true)
    }
    
}

fileprivate struct Model {
    
    var title: String
    var targetVC: UIViewController
    
}
