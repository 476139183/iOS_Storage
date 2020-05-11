//
//  ElegantStructViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/11.
//  Copyright © 2020 蔡强. All rights reserved.
//

// 优雅的结构体
// 本质就是结构体的嵌套使用

import UIKit

class ElegantStructViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 一个实际使用案例
        // font name
        
        let font = UIFont.Name.SFProText_Heavy
        
    }

}

fileprivate extension UIFont {
    
    static let Name = FontName()
    
    //let a = NSAttributedString.Key.foregroundColor
    
}

fileprivate struct FontName {
    
    let SFProText_Heavy = "SFProText-Heavy"
    let SFProText_LightItalic = "SFProText-LightItalic"
    let SFProText_HeavyItalic = "SFProText-HeavyItalic"
    
}
