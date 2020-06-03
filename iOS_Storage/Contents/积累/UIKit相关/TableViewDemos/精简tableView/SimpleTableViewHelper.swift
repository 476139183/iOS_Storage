//
//  SimpleTableViewHelper.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/3/31.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

class SimpleTableViewHelper: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var models: [SimpleTableViewModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
            cell?.textLabel?.numberOfLines = 0
        }
        cell?.textLabel?.text = models[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

struct SimpleTableViewModel {
    var title = ""
}
