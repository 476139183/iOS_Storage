//
//  DSActionSheetController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/1/8.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class DSActionSheetController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button1 = UIButton.init(type: .system)
        view.addSubview(button1)
        button1.frame = CGRect(x: 90, y: 190, width: 200, height: 40)
        button1.setTitle("没标题没详情", for: .normal)
        button1.addTarget(self, action: #selector(button1Clicked), for: .touchUpInside)
        
        let button2 = UIButton.init(type: .system)
        view.addSubview(button2)
        button2.frame = CGRect(x: 90, y: 290, width: 200, height: 40)
        button2.setTitle("有标题没详情", for: .normal)
        button2.addTarget(self, action: #selector(button2Clicked), for: .touchUpInside)
        
        let button3 = UIButton.init(type: .system)
        view.addSubview(button3)
        button3.frame = CGRect(x: 90, y: 390, width: 200, height: 40)
        button3.setTitle("没标题有详情", for: .normal)
        button3.addTarget(self, action: #selector(button3Clicked), for: .touchUpInside)
        
        let button4 = UIButton.init(type: .system)
        view.addSubview(button4)
        button4.frame = CGRect(x: 90, y: 490, width: 200, height: 40)
        button4.setTitle("有标题有详情", for: .normal)
        button4.addTarget(self, action: #selector(button4Clicked), for: .touchUpInside)
        
    }
    
    @objc private func button1Clicked() {
        let action1 = DSAlertAction.init(title: "第一个") {
            print("点击了第一个")
        }
        let action2 = DSAlertAction.init(title: "第二个") {
            print("点击了第二个")
        }
        let action3 = DSAlertAction.init(title: "删除", titleColor: .red, titleFont: .boldSystemFont(ofSize: 18)) {
            print("点击了删除")
        }
        DSActionSheet.showWith(title: nil, message: nil, actions: [action1, action2, action3])
    }
    
    @objc private func button2Clicked() {
        let action1 = DSAlertAction.init(title: "第一个") {
            print("点击了第一个")
        }
        let action2 = DSAlertAction.init(title: "第二个") {
            print("点击了第二个")
        }
        let action3 = DSAlertAction.init(title: "删除", titleColor: .red, titleFont: .boldSystemFont(ofSize: 15)) {
            print("点击了删除")
        }
        DSActionSheet.showWith(title: "这是title这是title这是title这是title这是title这是title这是title这是title这是title这是title这是title这是title", message: nil, actions: [action1, action2, action3])
    }
    
    @objc private func button3Clicked() {
        let action1 = DSAlertAction.init(title: "第一个") {
            print("点击了第一个")
        }
        let action2 = DSAlertAction.init(title: "第二个") {
            print("点击了第二个")
        }
        let action3 = DSAlertAction.init(title: "删除", titleColor: .red, titleFont: .boldSystemFont(ofSize: 15)) {
            print("点击了删除")
        }
        DSActionSheet.showWith(title: nil, message: "只有详情只有详情只有详情只有详情只有详情只有详情只有详情只有详情只有详情只有详情只有详情只有详情", actions: [action1, action2, action3])
    }

    
    @objc private func button4Clicked() {
        let action1 = DSAlertAction.init(title: "第一个") {
            print("点击了第一个")
        }
        let action2 = DSAlertAction.init(title: "第二个") {
            print("点击了第二个")
        }
        let action3 = DSAlertAction.init(title: "删除", titleColor: .red, titleFont: .boldSystemFont(ofSize: 15)) {
            print("点击了删除")
        }
        DSActionSheet.showWith(title: "这是title这是title这是title这是title这是title这是title这是title这是title这是title", message: "这是message这是message这是message这是message这是message这是message这是message这是message这是message", actions: [action1, action2, action3])
    }
    

}
