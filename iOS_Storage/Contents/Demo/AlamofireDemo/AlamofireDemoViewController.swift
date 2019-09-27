//
//  AlamofireDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/3.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireDemoViewController: CQBaseViewController {
    
    let downloadUrl = "http://dldir1.qq.com/qqfile/QQforMac/QQ_V6.5.5.dmg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupTableView()
        
//        loadCookData(with: "ss", success: { (d) in
//
//        }) { (msg) in
//
//        }
    }
    
    
    private func setupTableView() {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func loadCookData(with name: String, success responseDict: @escaping ([String: Any]) -> (), failure msg: (String) -> ()) {
        let urlString = "http://apis.juhe.cn/cook/query"
        var paraDict: [String : Any] = [:]
        paraDict["menu"] = "小炒肉"
        paraDict["key"] = "66864d74d580156ac49d63e1487a578a"
//        Alamofire.request(urlString, method: .get, parameters: paraDict, encoding: URLEncoding.default, headers: nil).response {response in
//
//        }
        
        Alamofire.request(urlString, method: .get, parameters: paraDict, encoding: URLEncoding.default, headers: nil).responseJSON { (data) in
            print(data)
        }
    }
    
    private lazy var dataArray: [ItemModel] = {
        var array = Array<ItemModel>()
        
        let model1 = ItemModel.init(title: "后台下载", sel: #selector(downloadInBackground))
        
        array.append(model1)
        
        return array
    }()
}

// MARK: Action
extension AlamofireDemoViewController {
    
    /// 后台下载
    @objc func downloadInBackground() {
        print("后台下载")
        
        CQBackgroundDownloadManager.shared.manager.download(self.downloadUrl) { (url, response) -> (destinationURL: URL, options: DownloadRequest.DownloadOptions) in
                let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                let fileUrl     = documentUrl?.appendingPathComponent(response.suggestedFilename!)
                return (fileUrl!,[.removePreviousFile,.createIntermediateDirectories])
            }
            .response { (downloadResponse) in
                print("下载回调信息: \(downloadResponse)")
            }
            .downloadProgress { (progress) in
                print("下载进度 : \(progress)")
        }
        
    }
    
}

// MARK: DataSource & Delegate
extension AlamofireDemoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellReuseID)
        }
        
        let model = self.dataArray[indexPath.row]
        cell?.textLabel?.text = model.title
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.dataArray[indexPath.row]
        
        if let sel = model.sel {
            self.perform(sel)
        }
    }
}


// MARK: -
fileprivate struct ItemModel {
    var title: String = ""
    var sel: Selector?
}


//class BackgroundDownloadManager: NSObject {
//    @objc static let shared = BackgroundDownloadManager()
//    
//    @objc let manager: SessionManager = {
//        let configuration = URLSessionConfiguration.background(withIdentifier: "com.cq.AlamofireTest.demo")
//        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
//        //        configuration.timeoutIntervalForRequest = 10
//        //        configuration.timeoutIntervalForResource = 10
//        //        configuration.sharedContainerIdentifier = "group.com.lgcooci.AlamofireTest"
//        
//        return SessionManager(configuration: configuration)
//    }()
//}
