//
//  CaptureScrollViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/4.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CaptureScrollViewController: CQBaseViewController {
    
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(scrollView)
        scrollView.frame = .init(x: 0, y: kNavigationBarHeight, width: screenWidth, height: screenHeight-kNavigationBarHeight)
        scrollView.backgroundColor = .orange
        scrollView.contentSize = .init(width: screenWidth, height: 2000)
        
        let imageView1 = UIImageView.init(image: UIImage.init(named: "AJ1"))
        imageView1.frame = .init(x: 20, y: 20, width: 90, height: 90)
        scrollView.addSubview(imageView1)
        
        let imageView2 = UIImageView.init(image: UIImage.init(named: "AJ5"))
        imageView2.frame = .init(x: 20, y: 1900, width: 90, height: 90)
        scrollView.addSubview(imageView2)
        
        
        let button = UIButton.init(type: .system)
        scrollView.addSubview(button)
        button.frame = .init(x: 20, y: 200, width: 100, height: 30)
        button.setTitle("截图", for: .normal)
        button.addTarget(self, action: #selector(capture), for: .touchUpInside)
        
    }
    
    @objc private func capture() {
        let image = scrollView.capture()
        
        //let data = image.pngData()
        
    }

}
