//
//  TableViewDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TableViewDemosViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var dataArray: [Model] = {
        return [Model.init(title: "标准TableView OC版", targetVC: CQStandardOCTableViewViewController()),
                Model.init(title: "标准TableView Swift版", targetVC: StandardSwiftTableViewViewController()),
                Model.init(title: "索引TableView", targetVC: IndexTableViewController()),
                Model.init(title: "无规律TableView", targetVC: IrregularityViewController()),
                Model.init(title: "表头图片下拉放大的TableView", targetVC: PullDownLargeViewController()),
                Model.init(title: "修改组头悬停位置", targetVC: ChangeSectionHeaderPositionViewController()),
                Model.init(title: "静态TableView", targetVC: StaticViewController()),
                Model.init(title: "TableView预加载", targetVC: PreloadTableViewController()),
                Model.init(title: "同种Model多种cell的TableView", targetVC: SameModelTableViewController()),
                Model.init(title: "精简TableView", targetVC: SimpleTableViewController()),
                Model.init(title: "急速TableView", targetVC: QuickTableViewController()),
                Model.init(title: "TableView的各种操作", targetVC: HandleTableViewController())]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(naviHeight)
        }
        
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
        cell?.textLabel?.text = dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = dataArray[indexPath.row].targetVC
        vc.title = dataArray[indexPath.row].title
        navigationController?.pushViewController(vc, animated: true)
    }

}

fileprivate struct Model {
    var title: String
    var targetVC: UIViewController
}
