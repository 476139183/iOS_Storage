//
//  FlatTableDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class FlatTableDemoViewController: FlatTableViewController<PersonModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.rowHeight = 50
        
        let p1 = PersonModel.init(name: "Jack")
        let p2 = PersonModel.init(name: "Mary")
        let p3 = PersonModel.init(name: "Ben")
        
        self.dataArray = [p1, p2, p3]
        
        tableView.rowHeight = 100
        
    }
    
    override func pullDownRefresh() {
        super.pullDownRefresh()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            if arc4random() % 2 == 0 {
                let p1 = PersonModel.init(name: "Jack")
                let p2 = PersonModel.init(name: "Mary")
                let p3 = PersonModel.init(name: "Ben")
                self.dataArray = [p1, p2, p3]
            } else {
                self.viewStatus = .error(title: "网络不给力")
            }
        }
    }
    
    override func pullUpLoadMore() {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            let p1 = PersonModel.init(name: "诸葛亮")
            let p2 = PersonModel.init(name: "司马懿")
            self.dataArray.append(contentsOf: [p1, p2])
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID) as? PersonCell
        if cell == nil {
            cell = PersonCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.model = dataArray[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
}

private class PersonCell: UITableViewCell {
    
    var model: PersonModel? {
        didSet {
            guard let model = self.model else {
                return
            }
            self.textLabel?.text = model.name
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
