//
//  RxSwiftDynamicTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import RxSwift

class RxSwiftDynamicTableViewController: CQBaseViewController, UITableViewDataSource {
    
    private let tableView = UITableView()
    private var dataArray: [String] = ["0"]
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        view.addSubview(tableView)
        tableView.frame = CGRect.init(x: 0, y: 100, width: screenWidth, height: 0)
        tableView.dataSource = self
        
        tableView.rx.observeWeakly(CGSize.self, "contentSize").subscribe(onNext: { [weak self] (size) in
            self?.tableView.height = size?.height ?? 0
        }).disposed(by: disposeBag)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "add", style: .plain, target: self, action: #selector(addData))
    }
    
    deinit {
        print("释放")
    }
    
    @objc private func addData() {
        dataArray.append("heheda")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className())
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: UITableViewCell.className())
        }
        cell?.backgroundColor = .orange
        cell?.textLabel?.text = dataArray[indexPath.row]
        return cell!
    }

}
