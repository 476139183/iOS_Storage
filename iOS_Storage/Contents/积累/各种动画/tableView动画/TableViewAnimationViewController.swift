//
//  TableViewAnimationViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewAnimationViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let disposeBag = DisposeBag()
    
    private var dataArray: [Int] = [0, 1, 2]
    
    private var isShowCell: Bool! = false
    private var cellCount = 0
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 40
        tableView.sectionHeaderHeight = 60
        tableView.sectionFooterHeight = 0
        tableView.estimatedRowHeight = 41
        tableView.estimatedSectionHeaderHeight = 61
        tableView.estimatedSectionFooterHeight = 1
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let footerView = UIView.init(frame: .init(x: 0, y: 0, width: 90, height: 100))
        footerView.backgroundColor = .blue
        tableView.tableFooterView = footerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isShowCell ? dataArray.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
            cell?.backgroundColor = .orange
        }
        cell?.textLabel?.text = String(indexPath.row)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "点击"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let reuseID = "headerReuseID"
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseID)
        if header == nil {
            header = UITableViewHeaderFooterView(reuseIdentifier: reuseID)
        }
        header?.contentView.backgroundColor = .red
        let tap = UITapGestureRecognizer()
        header?.addGestureRecognizer(tap)
        tap.rx.event.subscribe(onNext: { (tap) in
            self.isShowCell = !self.isShowCell
            
            let arr = self.dataArray.enumerated().map { (index, _) -> IndexPath in
                return IndexPath.init(row: index, section: 0)
            }
            
            self.tableView.beginUpdates()
            if self.isShowCell == true {
                self.tableView.insertRows(at: arr, with: .top)
            } else {
                self.tableView.deleteRows(at: arr, with: .bottom)
            }
            self.tableView.endUpdates()
            
            
        }).disposed(by: disposeBag)
        return header
    }
    
    private func Refresh() {
        
    }

}


fileprivate class MyHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
