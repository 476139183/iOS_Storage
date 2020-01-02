//
//  UIScrollViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/17.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class UIScrollViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let dataArray: [Model] =
        [Model(title: "在UIScrollView上添加UIControl", targetVC: UIScrollViewControlDemoController()),
         Model(title: "长图高度自适应", targetVC: LongImageViewController())]
    
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
        tableView.frame = view.bounds
    }
    
    
    // MARK: - UITableView DataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = self.dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = dataArray[indexPath.row].targetVC else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - UIScrollView Delegate
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("scrollViewWillEndDragging")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print("scrollViewDidScroll")
        
    }
    
}


// MARK: - Model

fileprivate struct Model {
    
    var title: String = ""
    var targetVC: UIViewController!
    
}
