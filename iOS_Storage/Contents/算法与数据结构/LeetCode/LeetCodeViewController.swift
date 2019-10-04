//
//  LeetCodeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/3.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

fileprivate struct Model {
    var title: String?
    var sel: Selector?
}

class LeetCodeViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let dataArray: [Model] = [Model.init(title: "两数之和", sel: #selector(twoSum))]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className())
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: UITableViewCell.className())
        }
        cell?.textLabel?.text = dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        perform(dataArray[indexPath.row].sel)
    }

}


// MARK: -
extension LeetCodeViewController {
    
    // MARK: - 两数之和
    @objc func twoSum() {
        let vc = LeetCodeTwoSumViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
