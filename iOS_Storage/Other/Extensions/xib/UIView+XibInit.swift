//
//  UIView+XibInit.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

extension UIView {
    
    class func loadNib() -> UIView {
        return Bundle.main.loadNibNamed(self.className, owner: nil, options: nil)!.first as! UIView
    }
    
}
