//
//  ZFPlayerDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ZFPlayerDemoViewController: CQBaseViewController {
    
    private let kVideoCover = "https://upload-images.jianshu.io/upload_images/635942-14593722fe3f0695.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
    
    private lazy var naviView: VideoNaviBar = {
        let naviView = VideoNaviBar()
        naviView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return naviView
    }()
    
    private lazy var player: ZFPlayerController = {
        let manager = ZFAVPlayerManager()
        manager.shouldAutoPlay = true
        
        let player = ZFPlayerController.init(playerManager: manager, containerView: containerView)
        player.controlView = controlView
//        player.assetURL = URL.init(string: "https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4")!
        player.assetURL = URL.init(string: "http://200024424.vod.myqcloud.com/200024424_709ae516bdf811e6ad39991f76a4df69.f20.mp4")!
        return player
        
    }()
    
    private lazy var containerView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private lazy var controlView: ZFPlayerControlView = {
        let controlView = ZFPlayerControlView()
        controlView.fastViewAnimated = true
        controlView.autoFadeTimeInterval = 0.3
        controlView.autoHiddenTimeInterval = 3
        controlView.prepareShowLoading = true
        controlView.prepareShowControlView = true
        controlView.landScapeControlView.titleLabel.numberOfLines = 2
        return controlView
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        title = "ZFPlayer"
        
        view.backgroundColor = .black
        
        self.naviBar.isHidden = true
        
        view.addSubview(naviView)
        naviView.titleLabel.text = "套你猴子你能忍？"
        naviView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(kNavigationBarHeight)
        }
        
        player.orientationWillChange = { [weak self] (player, isFullScreen) in
            
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            appDelegate?.allowOrentitaionRotation = isFullScreen
            
            self?.setNeedsStatusBarAppearanceUpdate()
            self?.naviView.isHidden = isFullScreen
            
            self?.showControlView()
        }
        
        player.playerDidToEnd = { [weak self] (asset) in
            
            self?.player.currentPlayerManager.prepareToPlay?()
            
            self?.showControlView()
            
        }
        
        //self.controlView.showTitle("视频标题长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长duan", coverURLString: kVideoCover, fullScreenMode: .automatic)
        
        
        view.addSubview(containerView)
        
        controlView.portraitControlView.fullScreenBtn.setImage(UIImage.init(named: "video_rotate_icon"), for: .normal)
        
        controlView.landScapeControlView.titleLabel.snp.remakeConstraints { (make) in
            var minX = 0
            let backButtonWidth = 40
            if isIphoneX {
                minX = 44 + backButtonWidth + 5
            } else {
                minX = 15 + backButtonWidth + 5
            }
            make.left.equalTo(minX)
            make.top.greaterThanOrEqualTo(0)
            make.width.equalTo(Int(screenHeight)-minX-30)
            make.height.greaterThanOrEqualTo(30)
            make.centerY.greaterThanOrEqualTo(controlView.landScapeControlView.backBtn)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player.isViewControllerDisappear = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player.isViewControllerDisappear = true
    }
    
    
    // MARK: - 布局
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print(player.isFullScreen)
        
        //self.containerView.frame = view.bounds
        self.containerView.frame = .init(x: 0, y: kNavigationBarHeight, width: screenWidth, height: screenHeight-kNavigationBarHeight-kHomeIndicatorHeight)
    }
    
    
    // MARK: - Action
    
    @objc private func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    /// 展示控制层
    private func showControlView() {
        if self.player.isFullScreen == true {
            self.controlView.showTitle("视频标题长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长duan", coverURLString: self.kVideoCover, fullScreenMode: .automatic)
        } else {
            self.controlView.showTitle("", coverURLString: self.kVideoCover, fullScreenMode: .automatic)
        }
    }
    
    
    // MARK: - 设置
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if player.isFullScreen {
            return .lightContent
        }
        return .default
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return player.isStatusBarHidden
    }
    
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    
    override var shouldAutorotate: Bool {
        return player.shouldAutorotate
    }
    

}


// MARK: - 自定义导航栏

fileprivate class VideoNaviBar: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "video_close_icon"), for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(backButton)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(53)
            make.right.equalTo(-39)
            make.bottom.equalToSuperview()
            make.height.equalTo(44)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.centerY.equalTo(titleLabel)
            make.left.equalTo(15)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
