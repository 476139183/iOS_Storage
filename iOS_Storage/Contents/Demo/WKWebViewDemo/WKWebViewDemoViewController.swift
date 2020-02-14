//
//  WKWebViewDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/5.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewDemoViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var dataArray: [Model] = {
        return [Model(title: "webview加载gif", targetVC: WebViewGifViewController()),
                Model(title: "注入HTML", targetVC: InjectHTMLViewController())]
    }()
    
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
    
    
    // MARK: - UITableView DataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(dataArray[indexPath.row].targetVC, animated: true)
    }
    
}


fileprivate struct Model {
    
    var title: String
    var targetVC: UIViewController
    
}
