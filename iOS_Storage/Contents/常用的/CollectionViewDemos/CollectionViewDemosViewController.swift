//
//  CollectionViewDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CollectionViewDemosViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {

    private lazy var dataArray: [Model] = {
        return [Model.init(title: "标准CollectionView OC版", targetVC: CQStandardOCCollectionViewViewController()),
                Model.init(title: "标准CollectionView Swift版", targetVC: StandardSwiftCollectionViewViewController()),
                Model.init(title: "常用CollectionViewLayout", targetVC: CollectionViewLayoutDemoViewController()),
                Model.init(title: "自定义UICollectionViewLayout", targetVC: CustomLayoutViewController())]
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
