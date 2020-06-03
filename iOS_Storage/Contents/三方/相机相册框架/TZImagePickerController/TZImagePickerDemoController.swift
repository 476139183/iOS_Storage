//
//  TZImagePickerDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/27.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import TZImagePickerController

class TZImagePickerDemoController: CQBaseViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private lazy var selectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("select", for: .normal)
        button.addTarget(self, action: #selector(openAlbum), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        view.addSubview(selectButton)
        
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        selectButton.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
    }
    
    /// 打开相册
    @objc fileprivate func openAlbum() {
        let imagePicker = TZImagePickerController(maxImagesCount: 1, delegate: self)
        imagePicker?.allowPickingGif = false
        imagePicker?.allowPickingVideo = false
        imagePicker?.allowTakeVideo = false
        imagePicker?.allowTakePicture = false
        imagePicker?.allowCameraLocation = false
        imagePicker?.allowPickingMultipleVideo = false
        imagePicker?.iconThemeColor = UIColor.gray
        imagePicker?.oKButtonTitleColorNormal = UIColor.blue
        imagePicker?.oKButtonTitleColorDisabled = .lightGray
        imagePicker?.showSelectedIndex = false
        imagePicker?.sortAscendingByModificationDate = false
        imagePicker?.scaleAspectFillCrop = true
        imagePicker?.showSelectBtn = false
        imagePicker?.naviBgColor = .white
        imagePicker?.barItemTextColor = UIColor.gray
        imagePicker?.naviTitleColor = UIColor.black
        imagePicker?.statusBarStyle = .default
        imagePicker?.notScaleImage = false
        imagePicker?.allowPickingOriginalPhoto = false
        imagePicker?.allowPickingImage = true
        imagePicker?.allowCrop = true // 允许裁剪，showSelectBtn为NO才生效
        imagePicker?.cropRect = .init(x: 0, y: screenHeight / 2 - screenWidth / 2, width: screenWidth, height: screenWidth)
        present(imagePicker!, animated: true, completion: nil)
    }

}

extension TZImagePickerDemoController: TZImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool) {
        // 选择的图片
        self.imageView.image = photos.first
    }
    
}
