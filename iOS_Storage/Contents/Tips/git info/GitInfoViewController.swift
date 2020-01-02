//
//  GitInfoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/1/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GitInfoViewController: CQBaseViewController, UITableViewDataSource {
    
    private lazy var infoDict: Dictionary = {
        return Bundle.main.infoDictionary!
    }()
    
    private lazy var infos: [String] = {
        return [
            "最后提交SHA：\(infoDict["GitCommitSHA"]!)",
            "当前所在分支：\(infoDict["GitCommitBranch"]!)",
            "最后提交用户：\(infoDict["GitCommitUser"]!)",
            "最后提交时间：\(infoDict["GitCommitDate"]!)",
            "本次编译时间：\(infoDict["BuildTime"]!)"
        ]
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.estimatedRowHeight = 40
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
            cell?.textLabel?.numberOfLines = 0
        }
        cell?.textLabel?.text = infos[indexPath.row]
        return cell!
    }

}
