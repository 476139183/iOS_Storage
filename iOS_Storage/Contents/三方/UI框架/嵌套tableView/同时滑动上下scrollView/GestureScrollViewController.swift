//
//  GestureScrollViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class GestureScrollViewController: CQBaseViewController {
    
    private lazy var mainScrollView: GestureMainScrollView = {
        let scrollView = GestureMainScrollView()
        scrollView.backgroundColor = .orange
        scrollView.contentSize = CGSize(width: kScreenWidth, height: 1000)
        return scrollView
    }()
    
    // 红色scrollView
    private lazy var redScrollView: GestureRedChildScrollView = {
        let scrollView = GestureRedChildScrollView()
        scrollView.contentSize = CGSize(width: 150, height: 1000)
        return scrollView
    }()
    
    // 绿色scrollView
    private lazy var greenScrollView: GestureGreenChildScrollView = {
        let scrollView = GestureGreenChildScrollView()
        scrollView.contentSize = CGSize(width: 150, height: 1000)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(redScrollView)
        mainScrollView.addSubview(greenScrollView)
        
        mainScrollView.frame = view.bounds
        redScrollView.frame = CGRect(x: 10, y: 400, width: 150, height: 200)
        greenScrollView.frame = CGRect(x: 180, y: 400, width: 150, height: 200)
    }

}
