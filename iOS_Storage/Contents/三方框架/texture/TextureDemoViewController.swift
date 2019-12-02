//
//  TextureDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/23.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TextureDemoViewController: CQBaseViewController {
    
    private let dataArray: [Model] = [Model(title: "ASViewController", targetVC: ASViewControllerDemoController()),
                                      Model(title: "ASTableView", targetVC: ASTableDemoController()),
                                      Model(title: "各种node", targetVC: TextureNodeDemoViewController())]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let tableView = UITableView.init(frame: self.view.bounds)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
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
        navigationController?.pushViewController(dataArray[indexPath.row].targetVC!, animated: true)
    }
    
}


fileprivate struct Model {
    var title: String?
    var targetVC: UIViewController?
}
