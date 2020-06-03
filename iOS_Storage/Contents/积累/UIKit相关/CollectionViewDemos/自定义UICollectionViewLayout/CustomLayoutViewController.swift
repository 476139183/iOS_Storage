//
//  CustomLayoutViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class CustomLayoutViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let dataArray: [Model] = [Model(title: "最大cell间距", sel: #selector(gotoMaxCellSpacingVC)),
                                      Model(title: "只有一个宽度自适应的cell靠左", sel: #selector(gotoLeftSideCellVC)),
                                      Model(title: "靠左并且可以设置最大间距", sel: #selector(gotoLeftSideMaxCellSpacingVC)),
                                      Model(title: "简单瀑布流", sel: #selector(gotoWaterfallVC))]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(kNavigationBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    
    // MARK: - action
    
    @objc private func gotoMaxCellSpacingVC() {
        let vc = MaxCellSpacingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoLeftSideCellVC() {
        let vc = LeftSideCellViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoLeftSideMaxCellSpacingVC() {
        let vc = LeftSideMaxCellSpacingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoWaterfallVC() {
        let vc = WaterfallViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellReuseID)
        }
        cell?.textLabel!.text = dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        perform(dataArray[indexPath.row].sel)
    }

}


fileprivate struct Model {
    
    var title = ""
    var sel: Selector?
    
}
