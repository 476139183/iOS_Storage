//
//  CompressImageViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/8.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CompressImageViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let image = UIImage.init(named: "big_image")
        let data = (image?.compress(withMaxLength: 120*1024))!
        
        
        let image2 = UIImage.init(data: data)
        let data2 = (image2?.compress(withMaxLength: 1))!
        
        let imageView = UIImageView.init(image: image2)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        
        let label = UILabel()
        view.addSubview(label)
        label.backgroundColor = .orange
        label.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.left.equalTo(50)
            make.height.equalTo(40)
        }
        
        label.text = "width = \(image2?.size.width ?? 0)"
        
    }

}

extension CompressImageViewController {
    
    private func 请注意() {
        
        let image: UIImage = UIImage.init(named: "big_image")!
        
        // 不是你以为的想压多小就压多小
        // 984798 bytes
        let originData = image.jpegData(compressionQuality: 1)
        // 149726 bytes = 146.2 kb
        let data2 = image.jpegData(compressionQuality: 0.1)
        // 149726 bytes
        let data3 = image.jpegData(compressionQuality: 0.01)
        // 149726 bytes
        let data4 = image.jpegData(compressionQuality: 0.0)
    }
    
}
