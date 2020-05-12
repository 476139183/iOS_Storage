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
        
        
        // 大家都写过富文本，相信对下面这段代码都不陌生
        // 比如系统的 NSAttributedString.Key
        let key = NSAttributedString.Key.font
        // 这个key就是一个结构体
        // font 是 NSAttributedString.Key extension 里的一个属性
        
        
        // 一个实际使用案例
        // 自定义 font name
        // 当时我就在想，怎么让它更优雅
        
        
        let font = UIFont.init(name: UIFont.Name.SFProText_HeavyItalic, size: 20)
        let font2 = UIFont.init(name: UIFont.Name2.SFProText_HeavyItalic, size: 20)
        
        print(UIFont.Name3.myFont)
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "Custom Font"
        label.font = font
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }

}


fileprivate extension UIFont {
    // 给UIFont扩展一个Name属性，这是我自己的写法
    static let Name = FontName()
    
    // 也可以这样扩展，这是仿照 NSAttributedString.Key 的写法
    struct Name2 {
        static let SFProText_HeavyItalic = "SFProText-HeavyItalic"
    }
    
    // 也可以用 class，不过就脱离主题了
    class Name3 {
        static let myFont = "myFont"
    }
}


fileprivate struct FontName {
    let SFProText_Heavy = "SFProText-Heavy"
    let SFProText_LightItalic = "SFProText-LightItalic"
    let SFProText_HeavyItalic = "SFProText-HeavyItalic"
}
