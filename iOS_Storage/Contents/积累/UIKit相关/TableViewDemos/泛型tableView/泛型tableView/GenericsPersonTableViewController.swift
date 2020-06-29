//
//  GenericsPersonTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/4.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsPersonTableViewController: GenericsTableViewController<PersonModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "泛型 person tableView"
        
        let p1 = PersonModel.init(name: "person1")
        let p2 = PersonModel.init(name: "person2")
        
        self.data = [p1, p2]
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
            cell?.textLabel?.text = data[indexPath.row].name
        }
        return cell!
    }

}

class PersonModel {
    
    var name = ""
    
    init(name: String) {
        self.name = name
    }
    
}
