//
//  PerfectAppViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/1/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class PerfectAppViewController: CQBaseViewController, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var titles: [String] = {
        return ["1.不仅顶部要适配刘海屏，底部也要适配刘海屏",
                "2.热点导致状态栏的变化",
                "3.异常情况的适配，如无网络、请求失败、空列表占位图的显示。",
                "4.进入一个页面时，请求数据的时候不应该展示占位图。（很多人没有处理这个，导致占位图闪现）",
                "5.不要忽略按钮和cell按下时的背景颜色。（这个很细，我所呆过的公司只有一家考虑了这种情况）",
                "6.能用 IconFont 就用 IconFont，这将极大的减小图标的体积。"]
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
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }

}
