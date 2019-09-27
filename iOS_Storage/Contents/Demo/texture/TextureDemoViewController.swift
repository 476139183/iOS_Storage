//
//  TextureDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/23.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TextureDemoViewController: CQBaseViewController {
    
    private let dataArray: Array = [Model.init(title: "ASViewController", sel: #selector(gotoASViewController)),
                                    Model.init(title: "tableView", sel: #selector(gotoASTableNodeDemoController))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let tableView = UITableView.init(frame: self.view.bounds)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}


// MARk: - Action

fileprivate extension TextureDemoViewController {
    @objc func gotoASViewController() {
        let vc = ASViewControllerDemoController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func gotoASTableNodeDemoController() {
        let vc = ASTableDemoController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - UITableView DataSource & Delegate

extension TextureDemoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellReuseID)
        }
        
        let model: Model = self.dataArray[indexPath.row]
        cell?.textLabel?.text = model.title
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model: Model = self.dataArray[indexPath.row]
        self.perform(model.sel)
    }
}


// MARK: - Other Class

fileprivate class Model: NSObject {
    var title: String?
    var sel: Selector?
    
    convenience init(title: String, sel: Selector) {
        self.init()
        self.title = title
        self.sel = sel
    }
}
