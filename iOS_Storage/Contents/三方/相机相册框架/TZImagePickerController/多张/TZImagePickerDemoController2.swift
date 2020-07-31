//
//  TZImagePickerDemoController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/31.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import TZImagePickerController

class TZImagePickerDemoController2: CQBaseViewController, TZImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var selectedAssets: [Any] = []
    var photos: [UIImage] = []
    
    private lazy var imagePicker: TZImagePickerController = {
        let picker = TZImagePickerController.init(maxImagesCount: 3, delegate: self)
        picker?.allowPickingOriginalPhoto = false
        picker?.allowPickingGif = true
        picker?.allowPickingVideo = false
        picker?.allowTakeVideo = false
        picker?.allowCameraLocation = false
        picker?.iconThemeColor = UIColor.red
        picker?.oKButtonTitleColorNormal = UIColor.red
        picker?.oKButtonTitleColorDisabled = .lightGray
        picker?.showSelectedIndex = true
        picker?.sortAscendingByModificationDate = false
        picker?.naviBgColor = .white
        picker?.barItemTextColor = UIColor.black
        picker?.naviTitleColor = UIColor.black
        picker?.statusBarStyle = .default
        return picker!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //imagePicker.selectedAssets = self.selectedAssets as? NSMutableArray
//        let picker = TZImagePickerController.init(maxImagesCount: 3, delegate: self)
//        picker?.allowPickingOriginalPhoto = false
//        picker?.allowPickingGif = true
//        picker?.allowPickingVideo = false
//        picker?.allowTakeVideo = false
//        picker?.allowCameraLocation = false
//        picker?.iconThemeColor = UIColor.red
//        picker?.oKButtonTitleColorNormal = UIColor.red
//        picker?.oKButtonTitleColorDisabled = .lightGray
//        picker?.showSelectedIndex = true
//        picker?.sortAscendingByModificationDate = false
//        picker?.naviBgColor = .white
//        picker?.barItemTextColor = UIColor.black
//        picker?.naviTitleColor = UIColor.black
//        picker?.statusBarStyle = .default
        imagePicker.selectedAssets = NSMutableArray.init(array: selectedAssets)
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func tz_imagePickerControllerDidCancel(_ picker: TZImagePickerController!) {
        //print(imagePicker.selectedAssets)
    }
    
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool) {
        selectedAssets = assets
        self.photos = photos
    }
    
    
}
