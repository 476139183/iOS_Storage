//
//  MapNaviViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/11.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MapNaviViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView.init();
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.frame = self.view.bounds
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if (cell == nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellReuseID)
        }
        
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "通过坐标导航"
        case 1:
            cell?.textLabel?.text = "通过地址导航"
        case 2:
            cell?.textLabel?.text = "通过“坐标+地址”导航"
            
        default: break
            
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            CQRouteManager.presentRouteNaviMenu(on: self, with: CLLocationCoordinate2DMake(30.655942, 104.077104))
        case 1:
            CQRouteManager.presentRouteNaviMenu(on: self, withDestination: "天府广场")
        case 2:
            CQRouteManager.presentRouteNaviMenu(on: self, withCoordate: CLLocationCoordinate2DMake(30.655942, 104.077104), destination: "T恤家(春熙北店)")
        default:
            break
        }
    }
    
}
