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
        
        let a = getTaobaoTimestamp()
        print(a)
        
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
        RequestManager.requestJSON(url: urlString, method: .get, success: { (json) in
            let model = InfoModel()
            model.province = json["error_code"].stringValue
            self.provinceLabel.text = model.province
        }, failure: { (info) in
            print(info)
        })
    }
    
}


//https://www.juhe.cn/docs/api/id/11

fileprivate class InfoModel {
    
    var province: String = ""
    
}



// MARK: - 获取淘宝timestamp（在closure里return一个方法）

extension AlamofireRequestViewController {
    
    private func getTaobaoTimestamp() -> String {
        
        let urlString = "http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp"
        
        var t = ""
        
        let semaphore = DispatchSemaphore(value: 0)
        
        AF.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            switch response.result {
            case .success(let jsonData):
                let json = jsonData
                
                // SwiftyJSON
                let dict = JSON(json)
                
                t = dict["data"]["t"].stringValue
                
                print("请求成功")
                
                semaphore.signal()
            case .failure(_):
                print("请求失败")
                
                semaphore.signal()
            }

            debugPrint(response)
            semaphore.wait()

        }
        
        return t
        
    }
    
}
