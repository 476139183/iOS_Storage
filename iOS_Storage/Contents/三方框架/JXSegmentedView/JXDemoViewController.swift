//
//  JXDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class JXDemoViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var dataArray: [Model] = [Model.init(title: "纯文本title", sel: #selector(gotoTextTitleSegmentVC)),
                                           Model.init(title: "文字和图片", sel: #selector(gotoImageAndTextSegementVC)),
                                           Model.init(title: "文字或图片", sel: #selector(gotoImageOrTextSegementVC)),
                                           Model.init(title: "混合cell", sel: #selector(gotoMixCellVC)),
                                           Model.init(title: "自定义cell", sel: #selector(gotoCustomCellVC)),
                                           Model.init(title: "红点segment", sel: #selector(gotoRedDotVC))]
    
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
    
    
    // MARK: - action
    
    @objc private func gotoTextTitleSegmentVC() {
        let vc = JXSegmentedViewDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoImageAndTextSegementVC() {
        let vc = JXImageTitleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoImageOrTextSegementVC() {
        let vc = JXImageOrTextViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoMixCellVC() {
        let vc = JXMixViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoCustomCellVC() {
        let vc = JXCustomViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoRedDotVC() {
        let vc = RedDotSegmentViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - UITableView DataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellReuseID)
        }
        cell?.textLabel!.text = self.dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        perform(self.dataArray[indexPath.row].sel)
    }
    
}

fileprivate struct Model {
    var title: String?
    var sel: Selector?
}
