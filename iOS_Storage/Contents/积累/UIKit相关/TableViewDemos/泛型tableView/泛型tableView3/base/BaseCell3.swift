//
//  BaseCell3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BaseCell3<M: Any>: UITableViewCell {
    
    class func cellWith(model: M, tableView: UITableView) -> BaseCell3 {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = self.init(style: .default, reuseIdentifier: reuseID)
        }
        if let curCell = cell! as? BaseCell3 {
            curCell.model = model
        }
        return cell! as! BaseCell3<M>
    }
    
    var model: M? {
        didSet {
            guard let model = self.model else {
                return
            }
            configModel(model)
        }
    }
    
    /// override in subclass
    func configModel(_ model: M) {
        
    }
    
    /// override in subclass
    func configUI() {
        
    }

    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
