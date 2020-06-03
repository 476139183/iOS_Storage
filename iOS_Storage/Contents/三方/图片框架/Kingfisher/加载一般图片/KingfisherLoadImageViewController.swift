//
//  KingfisherLoadImageViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/27.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import SDWebImage

class KingfisherLoadImageViewController: CQBaseViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = UIImage.init(named: "iu")
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 200, height: 200))
        }
        
        let url = URL(string: "https://dingstock-community.obs.cn-east-2.myhuaweicloud.com/Pyk85KtAts/rZYZV1IMgN/1590391865962418.jpeg?x-image-process=image/resize,p_50")
        let placeholder = UIImage.init(named: "iu")
        
        imageView.kf.setImage(with: url, placeholder: placeholder)
        
//        imageView.kf.setImage(with: URL.init(string: "https://dingstock-community.obs.cn-east-2.myhuaweicloud.com/Pyk85KtAts/rZYZV1IMgN/1590391865962418.jpeg?x-image-process=image/resize,p_50"))
//        imageView.kf.setImage(with: url, placeholder: , options: <#T##KingfisherOptionsInfo?#>, progressBlock: <#T##DownloadProgressBlock?##DownloadProgressBlock?##(Int64, Int64) -> Void#>, completionHandler: <#T##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##(Result<RetrieveImageResult, KingfisherError>) -> Void#>)
        
    }

}
