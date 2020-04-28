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
    //private let urlString = "http://upos-sz-mirrorhw.bilivideo.com/upgcxcode/92/33/181753392/181753392-1-208.mp4?e=ig8euxZM2rNcNbNjhWdVhwdlhbT1hwdVhoNvNC8BqJIzNbfqXBvEuENvNC8aNEVEtEvE9IMvXBvE2ENvNCImNEVEIj0Y2J_aug859r1qXg8gNEVE5XREto8z5JZC2X2gkX5L5F1eTX1jkXlsTXHeux_f2o859IB_&ua=tvproj&deadline=1587724044&gen=playurl&nbs=1&oi=3738359270&os=hwbv&trid=e31299d5df564007b9958e9c2696584d&uipk=5&upsig=cc7b40536ce1d9eb867d8683077603ab&uparams=e,ua,deadline,gen,nbs,oi,os,trid,uipk&mid=0"
    
    private let urlString = "https://aweme.snssdk.com/aweme/v1/playwm/?s_vid=93f1b41336a8b7a442dbf1c29c6bbc56f51358f2f452b001d011448d1305a8a183ab22928548c906783b43b01ce5385df2c507b37436fb21411d8b14ea7c739a&line=0"
    
    
    private lazy var rotateButton: UIButton = {
        let button = UIButton()
        button.setTitle("旋转", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(rotateButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var player: AVPlayer = {
        let player = AVPlayer.init(url: URL.init(string: urlString)!)
        player.play()
        //player.automaticallyWaitsToMinimizeStalling = false
        
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
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 开始生成设备旋转通知
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        // 添加设置旋转通知
        NotificationCenter.default.addObserver(self, selector: #selector(handleRotateNotif(notif:)), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 结束设备旋转通知
        UIDevice.current.endGeneratingDeviceOrientationNotifications()
        // 移除通知
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "AVPlayer"
        
        view.backgroundColor = .white
        
        view.layer.addSublayer(playerLayer)
        playerLayer.size = .init(width: 300, height: 300)
        playerLayer.position = view.center
        
        view.addSubview(rotateButton)
        rotateButton.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.bottom.equalTo(-90)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
    }

    private func setupVideo() {
        
        
        
    }
    
    @objc private func rotateButtonClicked() {
        view.transform = .init(rotationAngle: CGFloat(Double.pi/2))
    }
    
    @objc private func handleRotateNotif(notif: Notification) {
        print("旋转")
        
        let orient = UIDevice.current.orientation
        
        switch orient {
        case .landscapeLeft:
            print("左转")
            
            UIView.animate(withDuration: 0.3) {
                //self.view.frame = .init(x: 0, y: 0, width: screenHeight, height: screenWidth)
                self.view.transform = .init(rotationAngle: CGFloat(Double.pi/2))
            }
            
        case .landscapeRight:
            print("右转")
            UIView.animate(withDuration: 0.3) {
                //self.view.frame = .init(x: 0, y: 0, width: screenHeight, height: screenWidth)
                self.view.transform = .init(rotationAngle: -CGFloat(Double.pi/2))
            }
            
        default:
            print("默认状态")
            UIView.animate(withDuration: 0.3) {
                self.view.transform = .init(rotationAngle: 0)
                //self.view.frame = .init(x: 0, y: 0, width: screenHeight, height: screenHeight)
            }
            
        }
        
        //print(view.size.width)
        
        print(UIScreen.main.bounds.width)
        
    }
    
}
