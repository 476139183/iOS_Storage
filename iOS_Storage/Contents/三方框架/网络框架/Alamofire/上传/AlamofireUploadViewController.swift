//
//  AlamofireUploadViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AlamofireUploadViewController: CQBaseViewController {
    
    private lazy var uploadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("上传", for: .normal)
        button.addTarget(self, action: #selector(uploadButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "上传"
        
        view.addSubview(uploadButton)
        uploadButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 50))
        }
        
    }
    
    @objc private func uploadButtonClicked() {
//        uploadAvatar(image: UIImage(named: "")!, successHandler: {
//            print("上传成功")
//        }) { (info) in
//            print(info)
//        }
    }
    
    /// 上传头像
//    private func uploadAvatar(image: UIImage, successHandler: @escaping () -> (), failureHandler: (_ msg: String) -> ()) {
//        // url
//        let url = URL.init(string: "http://139.224.9.115:7290/upload")!
//        // header
//        let headers: HTTPHeaders = [
//            "Accept": "application/json;charset=utf-8",
//            "x-parse-session-token": "r:e32ed4961e6ad110de187aa32b7086f4"
//        ]
//        
//        AF.upload(multipartFormData: { (formData) in
//            let image = UIImage(named: "AJ1")
//            let imageData = image!.pngData()
//            formData.append(imageData!, withName: "file")
//            let module = "avatar"
//            let moduleData = module.data(using: .utf8)
//            formData.append(moduleData!, withName: "module")
//        }, to: url, to: )
//        
//        // 上传
//        AF.upload(multipartFormData: { (formData) in
//            let image = UIImage(named: "AJ1")
//            let imageData = image!.pngData()
//            formData.append(imageData!, withName: "file")
//            let module = "avatar"
//            let moduleData = module.data(using: .utf8)
//            formData.append(moduleData!, withName: "module")
//        }, to: url, usingThreshold: (10*1024*1024), method: .post, headers: headers) { (encodingResult) in
//            print(encodingResult)
//            switch encodingResult {
//            case .success(let upload, _, _):
//                upload.responseJSON { response in
//                    if let jsonValue = response.result.value {
//                        
//                        let jsonDictory = JSON(jsonValue as Any)
//                        
//                        let code = jsonDictory["result"]["code"].intValue
//                        let msg = jsonDictory["result"]["result"].stringValue
//                        
//                        if code == 20000 {
//                            print("上传成功")
//                        } else {
//                            print("上传失败：\(msg)")
//                        }
//                        
//                    }
//                }
//            case .failure(_):
//                print("网络错误")
//                
//            }
//        }
//    }
    
    
}


