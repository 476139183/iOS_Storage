//
//  BaseStaticTableDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/9/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BaseStaticTableDemoController: BaseStaticTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}
