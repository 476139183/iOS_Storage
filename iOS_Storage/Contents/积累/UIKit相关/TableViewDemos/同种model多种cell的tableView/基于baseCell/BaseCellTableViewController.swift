//
//  BaseCellTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/19.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BaseCellTableViewController<M: Any, C: BaseCell<M> >: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArray: [M] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
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
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(kNavigationBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return BaseCell<M>.cellWith(reuseID: "reuseID", model: dataArray[indexPath.row], tableView: tableView)
    }
    
}

/// 交通工具model
fileprivate class VehicleModel {
    
    enum VehicleType {
        case bike
        case car
    }
    
    var type: VehicleType = .car
    
}


fileprivate class VehicleCell {
    
    // 简单工厂，根据model创建不同的cell
    
    
}


class BaseCell<M: Any>: UITableViewCell {
    
    class func cellWith(reuseID: String, model: Any, tableView: UITableView) -> BaseCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = self.init(style: .default, reuseIdentifier: reuseID)
        }
        return cell! as! BaseCell<M>
    }
    
    var model: M? {
        didSet {
            
        }
    }
    
    var superTableView: UITableView? {
        for view in sequence(first: superview, next: { $0?.superview }) {
            if let tableView = view as? UITableView {
                return tableView
            }
        }
        return nil
    }
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



