//
//  StaticTableViewController1.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/8.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StaticTableViewController1: UITableViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        self.imageView.image = UIImage.init(named: "AJ5")
        self.label.text = "这是一个label"
        
        self.table.tableFooterView = UIView()
        
        self.navigationController?.navigationBar.isHidden = true
        
//        if #available(iOS 11.0, *) {
//            table.contentInsetAdjustmentBehavior = .never
//        } else {
//            automaticallyAdjustsScrollViewInsets = false
//        }
    }
    
    @IBAction func footerButtonClicked(_ sender: UIButton) {
        print("footer")
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        self.table.frame = .init(x: 0, y: naviHeight, width: screenWidth, height: screenHeight-naviHeight)
//    }

}
