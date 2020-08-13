//
//  UIImage+Equal.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 判断图片是否相同
    func isEqualToImage(image: UIImage) -> Bool {
        let data1: Data! = UIImage.pngData(self)()
        let data2: Data! = UIImage.pngData(image)()
        return data1 == data2
    }
    
}
