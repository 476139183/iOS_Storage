//
//  CameraManagerViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/9.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import CameraManager

class CameraManagerViewController: CQBaseViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        return imageView
    }()
    
    private lazy var cameraView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let cameraManager = CameraManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        view.addSubview(cameraView)
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.size.equalTo(CGSize.init(width: 200, height: 100))
            make.centerX.equalToSuperview()
        }
        
        cameraView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.centerX.size.equalTo(imageView)
        }
        
        
        cameraManager.addPreviewLayerToView(self.cameraView)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        cameraManager.capturePictureWithCompletion { (result) in
            switch result {
            case .failure:
                // error handling
                print("error")
            case .success(let content):
                self.imageView.image = content.asImage;
            }
        }
    }

}
