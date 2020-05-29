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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadLocalGif()
        loadWebGif()
        
    }
    
    private func loadLocalGif() {
        let path = Bundle.main.url(forResource: "加载中", withExtension: "gif")
        let resource = LocalFileImageDataProvider(fileURL: path!)
        localGifImageView.kf.setImage(with: resource)
    }
    
    private func loadWebGif() {
//        guard let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590748315288&di=7421926b34ababfbb1026494fda0d1b4&imgtype=0&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D117059215%2C1539528839%26fm%3D214%26gp%3D0.jpg") else { return }
        
        guard let url = URL(string: "https://dingstock-community.obs.cn-east-2.myhuaweicloud.com/evyCVWz6AC/s0mnNsxsE6/0.gif") else { return }
        // kingfisher可以直接设置网络gif
        webGifImageView.kf.setImage(with: url)
    }

}
