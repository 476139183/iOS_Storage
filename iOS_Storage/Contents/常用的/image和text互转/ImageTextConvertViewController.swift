//
//  ImageTextConvertViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/5.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ImageTextConvertViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // text转image
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 50))
        label.text = "heheda"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .orange
        
        
        let imageView = UIImageView.init(frame: CGRect.init(x: 90, y: 90, width: 100, height: 50))
        view.addSubview(imageView)
        imageView.image = createImage(with: label)
        
    }
    
    private func createImage(with view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
        
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage.init(named: "s")! }
        UIGraphicsEndImageContext()
        
        return image
        
    }
    

}
