//
//  GestureViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GestureViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var dataArray: [Model] = {
        return [Model.init(name: "单击手势", targetVC: TapGestureViewController()),
                Model.init(name: "轻扫手势", targetVC: SwipeGestureViewController()),
                Model.init(name: "长按手势", targetVC: LongPressGestureViewController()),
                Model.init(name: "平移手势", targetVC: PanGestureViewController()),
                Model.init(name: "捏合（缩放）手势", targetVC: PinchGestureViewController()),
                Model.init(name: "旋转手势", targetVC: RotationGestureViewController()),
                Model.init(name: "屏幕边缘平移手势", targetVC: ScreenEdgePanGestureViewController())]
    }()
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = dataArray[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = dataArray[indexPath.row].targetVC
        navigationController?.pushViewController(vc, animated: true)
    }

}

fileprivate struct Model {
    var name: String
    var targetVC: UIViewController
}
