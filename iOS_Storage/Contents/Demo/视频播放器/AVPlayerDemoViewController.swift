//
//  AVPlayerDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/24.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class AVPlayerDemoViewController: CQBaseViewController {
    
    private let urlString = "http://200024424.vod.myqcloud.com/200024424_709ae516bdf811e6ad39991f76a4df69.f20.mp4"
    private lazy var player: AVPlayer = {
        let player = AVPlayer.init(url: URL.init(string: urlString)!)
        player.play()
        player.automaticallyWaitsToMinimizeStalling = false
        
        return player
    }()
    
    private lazy var playerLayer: AVPlayerLayer = {
        let layer = AVPlayerLayer.init(player: player)
        layer.backgroundColor = UIColor.black.cgColor
        return layer
    }()
    
    private lazy var playerItem: AVPlayerItem = {
        let item = AVPlayerItem.init(url: URL.init(string: urlString)!)
        return item
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        title = "AVPlayer"
        
        view.layer.addSublayer(playerLayer)
        playerLayer.size = .init(width: 300, height: 300)
        playerLayer.position = view.center
        
    }

    private func setupVideo() {
        
        
        
    }
    
}
