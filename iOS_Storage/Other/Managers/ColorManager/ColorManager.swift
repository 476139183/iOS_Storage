//
//  ColorManager.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/23.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

extension UIColor {
    
    public static var titleColor: UIColor {
        return UIColor.colorWithHexString("373E4D")
    }
    
    public static var backgroundColor: UIColor {
        return #colorLiteral(red: 0.2453446062, green: 0.2748287671, blue: 0.7803938356, alpha: 1)
    }
    
    public static var cellColor: UIColor {
        return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
    
    public static var themeColor: UIColor {
        return UIColor.colorWithHexString("FF6C6C")
    }
    
    public static var text: UIColor {
        return .colorWithHexString("252525")
    }
    
    public static var tabSelectedColor: UIColor{
        return .colorWithHexString("FE6C6C")
    }
    
    public static var tabNormalColor: UIColor{
        return .colorWithHexString("C6CCD1")
    }
    
}
