//
//  FontTestViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class FontTestViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        for familyName in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print(fontName)
            }
        }
        
        
        let label1 = UILabel.init(frame: .init(x: 20, y: 90, width: 300, height: 50))
        view.addSubview(label1)
        label1.text = "system"
        label1.font = .systemFont(ofSize: 40)
        
        let label2 = UILabel.init(frame: .init(x: 20, y: 150, width: 300, height: 50))
        view.addSubview(label2)
        label2.text = "Papyrus"
        label2.font = UIFont(name: "Papyrus", size: 40)
        
        let label3 = UILabel.init(frame: .init(x: 20, y: 210, width: 300, height: 50))
        view.addSubview(label3)
        label3.text = "futura"
        label3.font = UIFont(name: "futura", size: 40)
        
        let label4 = UILabel.init(frame: .init(x: 20, y: 260, width: 300, height: 50))
        view.addSubview(label4)
        label4.text = "DINAlternate-Bold"
        label4.font = UIFont(name: "DINAlternate-Bold", size: 40)
        
        let label5 = UILabel.init(frame: .init(x: 20, y: 310, width: 300, height: 50))
        view.addSubview(label5)
        label5.text = "SFProText"
        label5.font = UIFont(name: "SFProText-Bold", size: 40)
        
        let label6 = UILabel.init(frame: .init(x: 0, y: 360, width: screenWidth, height: 50))
        view.addSubview(label6)
        label6.text = "粗体 系统 bold"
        label6.font = .boldSystemFont(ofSize: 30)
        
        let label7 = UILabel.init(frame: .init(x: 0, y: 410, width: screenWidth, height: 50))
        view.addSubview(label7)
        label7.text = "粗体Helvetica-BoldOblique"
        label7.font = UIFont(name: "Helvetica-BoldOblique", size: 30)
        
        let label8 = UILabel.init(frame: .init(x: 0, y: 460, width: screenWidth, height: 50))
        view.addSubview(label8)
        label8.text = "粗体HelveticaNeue-Medium"
        label8.font = UIFont(name: "HelveticaNeue-Medium", size: 30)
        
        
        print("====================")
        
        print("系统粗体：\(label6.font.fontName)")
        print("Helvetica粗体：\(label7.font.fontName)")
        print("HelveticaNeueMedium：\(label8.font.fontName)")
        
    }
    
    
}
