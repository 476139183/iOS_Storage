//
//  AlamofireRequestViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import SwiftyJSON

class AlamofireRequestViewController: CQBaseViewController {
    
    /// 电话号码输入栏
    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "请输入电话号码"
        return textField
    }()
    
    /// 省份
    private lazy var provinceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    /// 城市
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    /// 区号
    private lazy var areacodeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    /// 查询按钮
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("查询", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "请求数据"
        
        view.addSubview(phoneTextField)
        view.addSubview(provinceLabel)
        view.addSubview(searchButton)
        
        phoneTextField.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 200, height: 40))
        }
        
        provinceLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(phoneTextField)
            make.top.equalTo(phoneTextField.snp.bottom).offset(20)
        }
        
        searchButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(phoneTextField)
            make.top.equalTo(provinceLabel.snp.bottom).offset(40)
        }
        
    }
    
    @objc private func searchButtonClicked() {
        
        loadPhoneNumberInfo(phoneNumber: "18782298732", succcess: {
            
        }) {
            
        }
    }
    
    private func loadPhoneNumberInfo(phoneNumber: String, succcess: (() -> ())?, failure: (() -> ())?) {
        // url
        let urlString = "http://apis.juhe.cn/mobile/get"
        // 参数
        var paraDict: [String : Any] = [:]
        paraDict["phone"] = phoneNumber
        paraDict["key"] = "66864d74d580156ac49d63e1487a578a"
        
        // 请求
//        RequestManager.request(url: urlString, method: .get, parameters: paraDict, success: { (response) in
//
//        }) { (errorInfo) in
//
//        }
        
        Alamofire.request(urlString, method: .get, parameters: paraDict, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in

            if response.result.isSuccess { // 请求成功
                
                guard let json = response.result.value else {
                    return
                }
                
                let model = InfoModel()
                
                // SwiftyJSON
                let dict = JSON(json)
                model.province = dict["error_code"].stringValue
                
                self.provinceLabel.text = model.province
                
                print("请求成功")
            } else { // 请求失败
                print("请求失败")
            }

//            print(response.request)
//            print(response.response)
//            print(response.data)
//            print(response.result.isSuccess)
            print(response.result.value)

        }
        
        
    }
    
}


//https://www.juhe.cn/docs/api/id/11

fileprivate class InfoModel {
    
    var province: String = ""
    
}
