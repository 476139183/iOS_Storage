//
//  StoreAnnotation.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StoreAnnotation: MKPointAnnotation {
    
    /// 根据index跟数组元素对应
    var index: Int = 0
    var isSelected: Bool = false
    
    var name: String = ""
    var image: UIImage?
    
    
}
