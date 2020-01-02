//
//  ProtocolPersonCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/29.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ProtocolPersonCell: UITableViewCell, CellProtocol {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Cell Protocol
    
    var model: PersonCellModel? {
        didSet {
            
        }
    }
    
    func personDetailButtonClicked() {
        
    }
    
}

