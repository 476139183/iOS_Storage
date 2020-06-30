//
//  KingfisherLoadGifViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/29.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Kingfisher

class KingfisherLoadGifViewController: CQBaseViewController {
    
    @IBOutlet weak var localGifImageView: UIImageView!
    @IBOutlet weak var webGifImageView: UIImageView!
    
    
    
    // If you encountered to memory issues when dealing with large GIF, try to use AnimatedImageView instead of regular image view to display GIF. It will only decode several frames of your GIF image to get a smaller memory footprint (but high CPU load).
    private lazy var animatedView: AnimatedImageView = {
        let imageView = AnimatedImageView.init()
        imageView.repeatCount = .once
        imageView.autoPlayAnimatedImage = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(animatedView)
        animatedView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-100)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        loadLocalGif()
        loadWebGif()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadAnimatedGif()
    }
    
    private func loadLocalGif() {
        let path = Bundle.main.url(forResource: "ding2", withExtension: "gif")
        let resource = LocalFileImageDataProvider(fileURL: path!)
        localGifImageView.kf.setImage(with: resource)
    }
    
    
    private func loadWebGif() {
//        guard let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590748315288&di=7421926b34ababfbb1026494fda0d1b4&imgtype=0&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D117059215%2C1539528839%26fm%3D214%26gp%3D0.jpg") else { return }
        
        guard let url = URL(string: "https://dingstock-community.obs.cn-east-2.myhuaweicloud.com/evyCVWz6AC/s0mnNsxsE6/0.gif") else { return }
        // kingfisher可以直接设置网络gif
        webGifImageView.kf.setImage(with: url)
    }
    
    private func loadAnimatedGif() {
        let path = Bundle.main.url(forResource: "ding2", withExtension: "gif")
        let resource = LocalFileImageDataProvider(fileURL: path!)
        animatedView.kf.setImage(with: resource)
        animatedView.startAnimating()
    }

}
