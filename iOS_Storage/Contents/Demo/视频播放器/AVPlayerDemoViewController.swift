//
//  AVPlayerDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/24.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class AVPlayerDemoViewController: CQBaseViewController {
    
    //private let urlString = "http://200024424.vod.myqcloud.com/200024424_709ae516bdf811e6ad39991f76a4df69.f20.mp4"
    private let urlString = "http://upos-sz-mirrorhw.bilivideo.com/upgcxcode/92/33/181753392/181753392-1-208.mp4?e=ig8euxZM2rNcNbNjhWdVhwdlhbT1hwdVhoNvNC8BqJIzNbfqXBvEuENvNC8aNEVEtEvE9IMvXBvE2ENvNCImNEVEIj0Y2J_aug859r1qXg8gNEVE5XREto8z5JZC2X2gkX5L5F1eTX1jkXlsTXHeux_f2o859IB_&ua=tvproj&deadline=1587724044&gen=playurl&nbs=1&oi=3738359270&os=hwbv&trid=e31299d5df564007b9958e9c2696584d&uipk=5&upsig=cc7b40536ce1d9eb867d8683077603ab&uparams=e,ua,deadline,gen,nbs,oi,os,trid,uipk&mid=0"
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
